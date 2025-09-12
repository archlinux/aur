# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.6.24
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://codeberg.org/Mintsuki/jinx"
license=("BSD")
depends=('sh' 'awk' 'findutils' 'gcc' 'git' 'grep' 'gzip' 'perl' 'make' 'pkgconf' 'procps' 'tar' 'util-linux' 'wget' 'zstd' 'libarchive' 'openssl' 'zlib')
source=("git+https://codeberg.org/Mintsuki/jinx.git#tag=v${pkgver}?signed")
b2sums=('c54039a4a557c13a7e4dc6cebce9fa56ee031742afc4043eaa2f76c4cdc60e9936d6748b2729bf6805fb9c40da54380881af5c2035e4602d47143cb79de0ceee')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
