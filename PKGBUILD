# Maintainer: katoh <katoh_at_mikage.ne.jp>

pkgname=azdrawing
pkgver=1.5
pkgrel=12
pkgdesc='Painting software for line art and comics.'
arch=('i686' 'x86_64')
url='https://azelpg.gitlab.io/azsky2/soft/azdrawing.html'
license=('GPL-3.0-or-later')
options=('!debug')
depends=('hicolor-icon-theme' 'fontconfig' 'freetype2' 'libjpeg-turbo' 'libx11' 'libxext' 'libxft' 'libxi' 'zlib')
makedepends=('libxfixes')
source=("https://azelpg.gitlab.io/azsky2/soft/arc/${pkgname}-${pkgver}.tar.bz2")
md5sums=('93941ba7344bba236f658fbd69d99cfb')

build() {
  cd ${pkgname}-${pkgver}
  make prefix=/usr
}

package() {
  cd ${pkgname}-${pkgver}
  make prefix=${pkgdir}/usr install
  rm -f ${pkgdir}/usr/share/icons/hicolor/icon-theme.cache # HACK: For `exists in filesystem` error.
}
