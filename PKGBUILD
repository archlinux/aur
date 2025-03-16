# Maintainer: VCalV

pkgname=unpack-install-jammer
pkgver=0.2.0
pkgrel=1
pkgdesc="Extract files from install-jammer bundles"
arch=('any')
url="https://github.com/lod/unpack-install-jammer"
license=('GPL-3.0-only')
provides=("$pkgname")
conflicts=()
depends=(
	perl-modern-perl
	perl-compress-raw-lzma
	perl-term-progressbar
	perl-data-dump
	perl-file-homedir
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/lod/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
)
sha512sums=('SKIP')



package() {
  cd "${pkgname}-${pkgver}"
  install -Dm555 extract.pl "${pkgdir}/usr/bin/${pkgname}"
  install -Dm444 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm444 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
