# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfce4-panel-profiles
pkgver=1.0.14
pkgrel=2
pkgdesc="Simple application to manage Xfce panel layouts"
arch=('any')
url="https://docs.xfce.org/apps/xfce4-panel-profiles/start"
license=('GPL3')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'python-gobject' 'python-psutil')
makedepends=('intltool')
conflicts=('xfpanel-switch')
replces=('xfpanel-switch')
source=("https://archive.xfce.org/src/apps/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('6d08354e8c44d4b0370150809c1ed601d09c8b488b68986477260609a78be3f9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --python=python
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
