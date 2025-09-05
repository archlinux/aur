# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.6.14
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://codeberg.org/Mintsuki/jinx"
license=("BSD")
depends=('sh' 'awk' 'curl' 'debootstrap' 'findutils' 'gcc' 'git' 'grep' 'gzip' 'make' 'pkgconf' 'procps' 'tar' 'util-linux' 'libarchive' 'openssl' 'zlib')
source=("git+https://codeberg.org/Mintsuki/jinx.git#tag=v${pkgver}?signed")
b2sums=('28a08a61fa1bbf06a9b3a73b9127fb5b8062c837c215cdde66658735e47d8736e66e648c1b8baf701108ebb44723e974dc6ef4233efe5199b8238a5fbcf2b774')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
