# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=libdeepspeech
pkgver=0.4.1
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture - C++ native client + devel files."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
depends=('gcc-libs')
provides=('libdeepspeech')

# Set all sources.
_src_base_url="https://github.com/mozilla/DeepSpeech/releases/download/v$pkgver"
_raw_base_url="https://raw.githubusercontent.com/mozilla/DeepSpeech/v$pkgver/"
# amd64
source_x86_64=("$_src_base_url/native_client.amd64.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "libdeepspeech.pc")
sha512sums_x86_64=('91d892f3f40d0cf68118a0b71514fd31a452b9ad75a3689754b26bc5bcf852514188c42188e777741ca1ddbd43c11844d15cf63dc8ddf695c4c1dd5401b156a2'
                   '083412518064900cfd6987551b7eede7f40265a40ebc4c5948ef969e826be9477c3bca4fd7e899277e697d74577a31a67815183754474c5faab0302f1cae9105'
                   'de9e90971809865594ddd32e6687115c74ce2968e61121eca40bf5c8114b49d5c0e3c82b19b871b78b14c372d4954eadc2c3961944ed0821d4e52032f6b6534f')
# armv7h
source_armv7h=("$_src_base_url/native_client.rpi3.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "libdeepspeech.pc")
sha512sums_armv7h=('ab086d52a9df951e8a3c8f3cb37ffe926d77ae8ad56061a6ccb0b67e41456152d3883cecdc0fa7d0270df5b539e4e5669056f62e2f7a30f67bc5edb1c15eaf99'
                   '083412518064900cfd6987551b7eede7f40265a40ebc4c5948ef969e826be9477c3bca4fd7e899277e697d74577a31a67815183754474c5faab0302f1cae9105'
                   'de9e90971809865594ddd32e6687115c74ce2968e61121eca40bf5c8114b49d5c0e3c82b19b871b78b14c372d4954eadc2c3961944ed0821d4e52032f6b6534f')
# aarch64
source_aarch64=("$_src_base_url/native_client.arm64.cpu.linux.tar.xz"
                "$_raw_base_url/native_client/deepspeech.h"
                "libdeepspeech.pc")
sha512sums_aarch64=('792d0faae203c22dfa774e9881814a68dadd0d854c284d36efd4ba40fad05ebcb1f7060e6bf9f803ffdb6dd1837394a7d0526989321919133a0a7445c42a124f'
                   '083412518064900cfd6987551b7eede7f40265a40ebc4c5948ef969e826be9477c3bca4fd7e899277e697d74577a31a67815183754474c5faab0302f1cae9105'
                   'de9e90971809865594ddd32e6687115c74ce2968e61121eca40bf5c8114b49d5c0e3c82b19b871b78b14c372d4954eadc2c3961944ed0821d4e52032f6b6534f')

package() {
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	mkdir -p "$pkgdir/usr/lib/pkgconfig"
    install -Dm755 libdeepspeech.so "$pkgdir/usr/lib/libdeepspeech.so.$pkgver"
    ln -s "/usr/lib/libdeepspeech.so.$pkgver" "$pkgdir/usr/lib/libdeepspeech.so"
    install -Dm644 deepspeech.h "$pkgdir/usr/include"
    install -Dm644 libdeepspeech.pc "$pkgdir/usr/lib/pkgconfig/libdeepspeech.pc"
}
