# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=libdeepspeech
pkgver=0.5.0
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
sha512sums_x86_64=('0698b7cc63f15ee703962850f2860e6e5c11c0884258f664671c1d02a3664eea93970957c4770f2897afba68ca211b4ebeda30bac99a1fbf96c814d12f7a2ed0'
                   'c204b3a533acb4b308d7d7e10eec8dc9ad73e5da7a340fdbf2082d3c7c58c0e4dd0764693e62b05ceccd8b2859e0ecde2a658bc0d0b8c2f98a7204cdffc9748d'
                   '031c4b9b4bf0a6deb81c165fe1f4ac5f0a9a9c4d581650e75c6ae14b6069973fcadfc421c986cad70051d4c01214790a1782423ae08d4afdc9a2a2d8ddc84cfb')
# armv7h
source_armv7h=("$_src_base_url/native_client.rpi3.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "libdeepspeech.pc")
sha512sums_armv7h=('151b14acb15d1bf829c30e623bfe72cb0258c21a8cada6214cc8dfaf8fc8679d161ffb34d43d5ba7124c68361495a71745601e4071bf5ec1757aabb66b5975e9'
                   'c204b3a533acb4b308d7d7e10eec8dc9ad73e5da7a340fdbf2082d3c7c58c0e4dd0764693e62b05ceccd8b2859e0ecde2a658bc0d0b8c2f98a7204cdffc9748d'
                   '031c4b9b4bf0a6deb81c165fe1f4ac5f0a9a9c4d581650e75c6ae14b6069973fcadfc421c986cad70051d4c01214790a1782423ae08d4afdc9a2a2d8ddc84cfb')
# aarch64
source_aarch64=("$_src_base_url/native_client.arm64.cpu.linux.tar.xz"
                "$_raw_base_url/native_client/deepspeech.h"
                "libdeepspeech.pc")
sha512sums_aarch64=('85319e129e1b8fc38c55327ae6524ea0514661f65d21b18a79bbe871b672a5530a784e2304c0205011f22045cab2b10b0d67f1edcc4d7d5da73e0c82b2503b64'
                   'c204b3a533acb4b308d7d7e10eec8dc9ad73e5da7a340fdbf2082d3c7c58c0e4dd0764693e62b05ceccd8b2859e0ecde2a658bc0d0b8c2f98a7204cdffc9748d'
                   '031c4b9b4bf0a6deb81c165fe1f4ac5f0a9a9c4d581650e75c6ae14b6069973fcadfc421c986cad70051d4c01214790a1782423ae08d4afdc9a2a2d8ddc84cfb')

package() {
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	mkdir -p "$pkgdir/usr/lib/pkgconfig"
    install -Dm755 libdeepspeech.so "$pkgdir/usr/lib/libdeepspeech.so.$pkgver"
    ln -s "/usr/lib/libdeepspeech.so.$pkgver" "$pkgdir/usr/lib/libdeepspeech.so"
    install -Dm644 deepspeech.h "$pkgdir/usr/include"
    install -Dm644 libdeepspeech.pc "$pkgdir/usr/lib/pkgconfig/libdeepspeech.pc"
}
