# Maintainer: VCalV

pkgname=unpack-install-jammer
pkgver=0.3.0
pkgrel=1
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
sha512sums=('847729a42dcd3026d0f81df0281c1fb456173bf8ccfe3bde1d1fb6bc2da72aacde164a6bc8679345e2ac979632478dd1229dad81ebb9235d74285207622bfac8')



package() {
  cd "${pkgname}-${pkgver}"
  install -Dm555 extract.pl "${pkgdir}/usr/bin/${pkgname}"
  install -Dm444 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm444 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
