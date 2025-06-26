# Maintainer: VCalV

pkgname=unpack-install-jammer
pkgver=0.2.0
pkgrel=3
pkgdesc="Extract files from install-jammer installers"
arch=('any')
url="https://github.com/lod/unpack-install-jammer"
license=('GPL-3.0-or-later')
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
sha512sums=(074d9cde890db77a578fefe7f822e50c089edf4621ac04cfeb86c2f9410c796393348512bff779ff46d9eeaf0a3df982789721658a0d4416752307fd62e91750)



package() {
  cd "${pkgname}-${pkgver}"
  install -Dm555 extract.pl "${pkgdir}/usr/bin/${pkgname}"
  install -Dm444 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm444 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
