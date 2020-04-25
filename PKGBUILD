# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=deepspeech-bin
pkgver=0.7.0
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
sha512sums_x86_64=('5690f13e8b8d05ebb883a0c34ccbf743d228fefca66bdfa4314165bdbd4329b40cdaa9f914e052a1dd30dfe1a7f595439bb9af2fb1bf0da26a1590fa9b063749'
                   '015ec15beff4fed1fc3e91fd57668bc8a5d9e2b9f34b75e5c0747db0329205df6860406d6d732f48da0c3a0e1daf70333e9ce257cc1eb3612edf5fe63caf8ccf'
                   'cbd0c184ea1831d6e41d8a3e8567405f81c9288617ee672c9349c5308a7f8ff008495eecb3060751508c14c28c47ba4155101abc73d32df0bdc72bf86e6e608d')

# armv7h
source_armv7h=("$_src_base_url/native_client.rpi3.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "deepspeech.pc")
sha512sums_armv7h=('c3302cab03f006de00713732d97ab9da3b0af5a75d3b38179a717da197684b37a2985d07689582aed7eeb0c97228816629a9e925a518adbde276b3019b28a3c7'
                   '015ec15beff4fed1fc3e91fd57668bc8a5d9e2b9f34b75e5c0747db0329205df6860406d6d732f48da0c3a0e1daf70333e9ce257cc1eb3612edf5fe63caf8ccf'
                   'cbd0c184ea1831d6e41d8a3e8567405f81c9288617ee672c9349c5308a7f8ff008495eecb3060751508c14c28c47ba4155101abc73d32df0bdc72bf86e6e608d')

# aarch64
source_aarch64=("$_src_base_url/native_client.arm64.cpu.linux.tar.xz"
                "$_raw_base_url/native_client/deepspeech.h"
                "deepspeech.pc")
sha512sums_aarch64=('bf5b1006189de433681ddc0f49d91e3cf5ebf4b6d7866ae3a09b1238270af0cef36e881df7aaa0e6f561437f10773e819fa43cba64b1d28413b6525c2f150bfd'
                    '015ec15beff4fed1fc3e91fd57668bc8a5d9e2b9f34b75e5c0747db0329205df6860406d6d732f48da0c3a0e1daf70333e9ce257cc1eb3612edf5fe63caf8ccf'
                    'cbd0c184ea1831d6e41d8a3e8567405f81c9288617ee672c9349c5308a7f8ff008495eecb3060751508c14c28c47ba4155101abc73d32df0bdc72bf86e6e608d')

package() {
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	mkdir -p "$pkgdir/usr/lib/pkgconfig"
    install -Dm755 libdeepspeech.so "$pkgdir/usr/lib/libdeepspeech.so.$pkgver"
    ln -s "/usr/lib/libdeepspeech.so.$pkgver" "$pkgdir/usr/lib/libdeepspeech.so"
    install -Dm644 deepspeech.h "$pkgdir/usr/include"
    install -Dm644 deepspeech.pc "$pkgdir/usr/lib/pkgconfig/deepspeech.pc"
}
