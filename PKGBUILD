# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=deepspeech-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture - C++ native client + devel files."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
depends=('gcc-libs')
provides=('deepspeech')
conflicts=('deepspeech')

# Set all sources.
_src_base_url="https://github.com/mozilla/DeepSpeech/releases/download/v$pkgver"
_raw_base_url="https://raw.githubusercontent.com/mozilla/DeepSpeech/v$pkgver/"
# amd64
source_x86_64=("$_src_base_url/native_client.amd64.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "deepspeech.pc")
sha512sums_x86_64=('71e815d8764a4f52bfee85c49b6767c04cd92a99c8a3412fb5c57b74f0dfc975312236b43c04cfff390850d1b3444dee8cb065dfa9fa83be8eda29eef7b5335a'
                   '015ec15beff4fed1fc3e91fd57668bc8a5d9e2b9f34b75e5c0747db0329205df6860406d6d732f48da0c3a0e1daf70333e9ce257cc1eb3612edf5fe63caf8ccf'
                   '15938203fe48cfa0602295430933fe331089dd889744e97140d89dd5ece60365b60ee09d010e3bf0f5a02d711000f218dcd6c9ae16eb500f84b83395231111cb')

# armv7h
source_armv7h=("$_src_base_url/native_client.rpi3.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "deepspeech.pc")
sha512sums_armv7h=('f84e00508b229509550b32fa25c7aeb268e78614e05989d023a70d676824d653bf880f2a8a976ffea2ee4c26aa261398e9ce474eef1dd3c83e9d97b54728a838'
                   '015ec15beff4fed1fc3e91fd57668bc8a5d9e2b9f34b75e5c0747db0329205df6860406d6d732f48da0c3a0e1daf70333e9ce257cc1eb3612edf5fe63caf8ccf'
                   '15938203fe48cfa0602295430933fe331089dd889744e97140d89dd5ece60365b60ee09d010e3bf0f5a02d711000f218dcd6c9ae16eb500f84b83395231111cb')

# aarch64
source_aarch64=("$_src_base_url/native_client.arm64.cpu.linux.tar.xz"
                "$_raw_base_url/native_client/deepspeech.h"
                "deepspeech.pc")
sha512sums_aarch64=('f1ae11dc8ac069365baa3bf12db2d0b19c7e1b46bd37d950423d50a09a124c5dcc847a9956a37e281db5f474defb59254d533fd348f235c91fa6558abf633604'
                    '015ec15beff4fed1fc3e91fd57668bc8a5d9e2b9f34b75e5c0747db0329205df6860406d6d732f48da0c3a0e1daf70333e9ce257cc1eb3612edf5fe63caf8ccf'
                    '15938203fe48cfa0602295430933fe331089dd889744e97140d89dd5ece60365b60ee09d010e3bf0f5a02d711000f218dcd6c9ae16eb500f84b83395231111cb')

package() {
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	mkdir -p "$pkgdir/usr/lib/pkgconfig"
    install -Dm755 libdeepspeech.so "$pkgdir/usr/lib/libdeepspeech.so.$pkgver"
    ln -s "/usr/lib/libdeepspeech.so.$pkgver" "$pkgdir/usr/lib/libdeepspeech.so"
    install -Dm644 deepspeech.h "$pkgdir/usr/include"
    install -Dm644 deepspeech.pc "$pkgdir/usr/lib/pkgconfig/deepspeech.pc"
}
