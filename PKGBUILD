# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfce4-panel-profiles
pkgver=1.0.13
pkgrel=1
pkgdesc="Simple application to manage Xfce panel layouts"
arch=('any')
url="https://git.xfce.org/apps/xfce4-panel-profiles/about/"
license=('GPL3')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'python-gobject')
makedepends=('intltool')
conflicts=('xfpanel-switch')
replces=('xfpanel-switch')
source=("https://archive.xfce.org/src/apps/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('bc387c13f94109422dc72b0fcb919b0dc11619ba589d03e492252b0d2513b170')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --python=python
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
