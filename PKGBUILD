# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=libdeepspeech
pkgver=0.6.1
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
sha512sums_x86_64=('9388f369da412c95c962e3d3dc18322cf84d693cec0cb9621aaa83cbde5cd2a5214e14aeab7985d9e8cde8ded0b4816bab163f433eaf27243b00c434d5f35c24'
                   '721ee5c8eeba947182a6e1db38c8cd1292e993f7ce04db273c7f699fd88b8e8f324dce4c1b198dd327265cdee1abf68726f5b67bdfff92f4c862c8eb437e8717'
                   'cbd0c184ea1831d6e41d8a3e8567405f81c9288617ee672c9349c5308a7f8ff008495eecb3060751508c14c28c47ba4155101abc73d32df0bdc72bf86e6e608d')
# armv7h
source_armv7h=("$_src_base_url/native_client.rpi3.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "libdeepspeech.pc")
sha512sums_armv7h=('edac15e07e260e3e74a954b4cb138fef9155a48a68a79a94dbc676bc8c285036e8e388ab1839450fde3b58918885fd47f831b17a8b05710c838dade49d328243'
                   '721ee5c8eeba947182a6e1db38c8cd1292e993f7ce04db273c7f699fd88b8e8f324dce4c1b198dd327265cdee1abf68726f5b67bdfff92f4c862c8eb437e8717'
                   'cbd0c184ea1831d6e41d8a3e8567405f81c9288617ee672c9349c5308a7f8ff008495eecb3060751508c14c28c47ba4155101abc73d32df0bdc72bf86e6e608d')
# aarch64
source_aarch64=("$_src_base_url/native_client.arm64.cpu.linux.tar.xz"
                "$_raw_base_url/native_client/deepspeech.h"
                "libdeepspeech.pc")
sha512sums_aarch64=('7f44ae3076a423f6bcd2377acb885f01e63b5b89f631cd2e2a481efb6bf6842442aa00e1bd97d5d5d7166b32eab3f96abcd432d2721aa87ca9256d3a808e6944'
                   '721ee5c8eeba947182a6e1db38c8cd1292e993f7ce04db273c7f699fd88b8e8f324dce4c1b198dd327265cdee1abf68726f5b67bdfff92f4c862c8eb437e8717'
                   'cbd0c184ea1831d6e41d8a3e8567405f81c9288617ee672c9349c5308a7f8ff008495eecb3060751508c14c28c47ba4155101abc73d32df0bdc72bf86e6e608d')

package() {
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	mkdir -p "$pkgdir/usr/lib/pkgconfig"
    install -Dm755 libdeepspeech.so "$pkgdir/usr/lib/libdeepspeech.so.$pkgver"
    ln -s "/usr/lib/libdeepspeech.so.$pkgver" "$pkgdir/usr/lib/libdeepspeech.so"
    install -Dm644 deepspeech.h "$pkgdir/usr/include"
    install -Dm644 libdeepspeech.pc "$pkgdir/usr/lib/pkgconfig/libdeepspeech.pc"
}
