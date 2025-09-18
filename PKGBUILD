# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.7.4
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://codeberg.org/Mintsuki/jinx"
license=("BSD")
depends=('sh' 'awk' 'findutils' 'gcc' 'git' 'grep' 'gzip' 'perl' 'make' 'pkgconf' 'procps' 'tar' 'util-linux' 'wget' 'zstd' 'libarchive' 'openssl' 'zlib')
source=("git+https://codeberg.org/Mintsuki/jinx.git#tag=v${pkgver}?signed")
b2sums=('cc398c0df76fe674badd58dd83c6f2a233cbba175d739e8cd680079d42ce498c3b3755afc802310cd2f57474aebea0d5c2e18578d2201e7fbc0c2a2b5bf6b1cc')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
