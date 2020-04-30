# Maintainer: Benjamin Vialle <archlinux@vialle.io>
# PGP ID: 72DF86FBBBBD5EDAE8FF1834826884A347F9FD9A

pkgname=man-pages-fr
pkgver=4.0.0
pkgrel=1
pkgdesc="French man pages"
arch=('any')
url="https://salsa.debian.org/manpages-l10n-team/manpages-l10n"
license=('GPL3')
conflicts=('man-pages-fr-git')
depends=('man-db')
makedepends=('po4a')
changelog=$pkgname.changelog
options=('!emptydirs')
source=(https://salsa.debian.org/manpages-l10n-team/manpages-l10n/-/archive/v$pkgver/manpages-fr-l10n-v${pkgver}.tar.bz2)
sha512sums=('9b9c625f4f1f39abd101713a71db2806acc81e64112b0090bc26f53070157c27062ca50b3588962ecadc9a2f6875f1ae50f394debd16af31fd2cd6ec8eb50da2')

build() {
  cd "${srcdir}"/manpages-l10n-v4.0.0-2dbc11eb6129ead47dd8a4590189164b5707c85f
  ./configure --prefix=/usr --enable-distribution=archlinux
  
  cd po/fr
  make
}

package() {
  cd "${srcdir}"/manpages-l10n-v4.0.0-2dbc11eb6129ead47dd8a4590189164b5707c85f/po/fr

  make DESTDIR="${pkgdir}" install
}
