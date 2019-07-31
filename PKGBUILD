# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfce4-panel-profiles
pkgver=1.0.9
pkgrel=1
pkgdesc="Simple application to manage Xfce panel layouts"
arch=('any')
url="https://git.xfce.org/apps/xfce4-panel-profiles/about/"
license=('GPL3')
groups=('xfce4-goodies' 'xfce4-goodies-devel')
depends=('xfce4-panel' 'gtk3' 'python-gobject')
makedepends=('intltool' 'git')
conflicts=('xfpanel-switch')
replces=('xfpanel-switch')
source=("https://archive.xfce.org/src/apps/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a8c00af838e85d00600dbf442c8741aa21a332fbceba849e0820560630a6e0ce')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --python=python
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
