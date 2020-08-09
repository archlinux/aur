# Maintainer: Benjamin Vialle <archlinux@vialle.io>
# PGP ID: 72DF86FBBBBD5EDAE8FF1834826884A347F9FD9A

pkgname=man-pages-fr
pkgver=4.1.0
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
sha512sums=('b22dc9289bd1b1fc308727c993bd3c2857925ca58e8012b88548ffab967a055979615a1cfc8ff769f1f6b4fd96c3b5ae1ac367847759b7254900808531087ee1')

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
