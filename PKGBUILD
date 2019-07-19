# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=libdeepspeech
pkgver=0.5.1
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
sha512sums_x86_64=('a5155183bf1ed7b2a506c282019111f9a1e8087023597c70f5d66d5a2a6af258682bac0dde3bf1a9d051d43cf347a25e2d93cfad6a009bb55703fb8f6a853167'
                   'c204b3a533acb4b308d7d7e10eec8dc9ad73e5da7a340fdbf2082d3c7c58c0e4dd0764693e62b05ceccd8b2859e0ecde2a658bc0d0b8c2f98a7204cdffc9748d'
                   'a14a6d9c35125fe655d05c8cdfc71a0796232612e9401bca3cf8d3acc43dc6d71ea3c6e056d2bf5581c83e30531fbe38ab02f2e9af51cbae640916243def856e')
# armv7h
source_armv7h=("$_src_base_url/native_client.rpi3.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "libdeepspeech.pc")
sha512sums_armv7h=('d2aa7fa3b2c1bf7f88b10850a69ed7ec0c1b1521f9f66f27849752d69edf02c3e5a6b66354db2dae6681463236d41edb8a9da5d8ab853adc7baa118e42df7c64'
                   'c204b3a533acb4b308d7d7e10eec8dc9ad73e5da7a340fdbf2082d3c7c58c0e4dd0764693e62b05ceccd8b2859e0ecde2a658bc0d0b8c2f98a7204cdffc9748d'
                   'a14a6d9c35125fe655d05c8cdfc71a0796232612e9401bca3cf8d3acc43dc6d71ea3c6e056d2bf5581c83e30531fbe38ab02f2e9af51cbae640916243def856e')
# aarch64
source_aarch64=("$_src_base_url/native_client.arm64.cpu.linux.tar.xz"
                "$_raw_base_url/native_client/deepspeech.h"
                "libdeepspeech.pc")
sha512sums_aarch64=('73fff81def1b225772a3053782838fb9d82442b6887dbb783af706bb79a5c1bfb1a8dd8c4fdbffa5d747b3c36bab060e89853c95a85c19f7d13a61902fccd711'
                   'c204b3a533acb4b308d7d7e10eec8dc9ad73e5da7a340fdbf2082d3c7c58c0e4dd0764693e62b05ceccd8b2859e0ecde2a658bc0d0b8c2f98a7204cdffc9748d'
                   'a14a6d9c35125fe655d05c8cdfc71a0796232612e9401bca3cf8d3acc43dc6d71ea3c6e056d2bf5581c83e30531fbe38ab02f2e9af51cbae640916243def856e')

package() {
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	mkdir -p "$pkgdir/usr/lib/pkgconfig"
    install -Dm755 libdeepspeech.so "$pkgdir/usr/lib/libdeepspeech.so.$pkgver"
    ln -s "/usr/lib/libdeepspeech.so.$pkgver" "$pkgdir/usr/lib/libdeepspeech.so"
    install -Dm644 deepspeech.h "$pkgdir/usr/include"
    install -Dm644 libdeepspeech.pc "$pkgdir/usr/lib/pkgconfig/libdeepspeech.pc"
}
