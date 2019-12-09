# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=libdeepspeech
pkgver=0.6.0
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
sha512sums_x86_64=('41f12d272eafc94b1a3388c475072c8b165913f376a5660715d26ca5f5901ca8742bbba1c373b54ef4e0e449dc61e5a6a75de15a9c4c3d36bbdb12352e504b13'
                   'd0943527a8f233abec80a4a70c286de96fcfd3381844d8139fe569ff4ce93135f57504b2d19e3e00d1b98bcac5a579ca89f89fc15da028ef8134c24fb7c7fd86'
                   'f455cf8ce8b50be120b111e3020cc6b63a4450a38ef720db1291ce640cea6ef10f930c003d154da55118edc90b00c5ba8038896b410b6b5670b1964de8b20d02')
# armv7h
source_armv7h=("$_src_base_url/native_client.rpi3.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "libdeepspeech.pc")
sha512sums_armv7h=('0243ba8d4e973421544f95a16eba53a01e751a708932b20c7b17e2d8182d9969f6a83143e25220b5469db814032731d0111b83bf59b97e377778e2ab2f7c0a0e'
                   'd0943527a8f233abec80a4a70c286de96fcfd3381844d8139fe569ff4ce93135f57504b2d19e3e00d1b98bcac5a579ca89f89fc15da028ef8134c24fb7c7fd86'
                   'f455cf8ce8b50be120b111e3020cc6b63a4450a38ef720db1291ce640cea6ef10f930c003d154da55118edc90b00c5ba8038896b410b6b5670b1964de8b20d02')
# aarch64
source_aarch64=("$_src_base_url/native_client.arm64.cpu.linux.tar.xz"
                "$_raw_base_url/native_client/deepspeech.h"
                "libdeepspeech.pc")
sha512sums_aarch64=('28fb47dba179da7e04a1e46a6e06a2bd27ad32e77a32da5f44bebb9b91c28a51dc1adc8154347b6be5dbe89db1a5f2f25d4c957c211ccc5b72ef205e940e56a3'
                   'd0943527a8f233abec80a4a70c286de96fcfd3381844d8139fe569ff4ce93135f57504b2d19e3e00d1b98bcac5a579ca89f89fc15da028ef8134c24fb7c7fd86'
                   'f455cf8ce8b50be120b111e3020cc6b63a4450a38ef720db1291ce640cea6ef10f930c003d154da55118edc90b00c5ba8038896b410b6b5670b1964de8b20d02')

package() {
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	mkdir -p "$pkgdir/usr/lib/pkgconfig"
    install -Dm755 libdeepspeech.so "$pkgdir/usr/lib/libdeepspeech.so.$pkgver"
    ln -s "/usr/lib/libdeepspeech.so.$pkgver" "$pkgdir/usr/lib/libdeepspeech.so"
    install -Dm644 deepspeech.h "$pkgdir/usr/include"
    install -Dm644 libdeepspeech.pc "$pkgdir/usr/lib/pkgconfig/libdeepspeech.pc"
}
