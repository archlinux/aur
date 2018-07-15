# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfce4-panel-profiles
pkgver=1.0.7
pkgrel=1
pkgdesc="Simple application to manage Xfce panel layouts"
arch=('any')
url="https://launchpad.net/xfpanel-switch"
license=('GPL3')
depends=('xfce4-panel' 'gtk3' 'python-gobject')
makedepends=('intltool' 'git')
conflicts=('xfpanel-switch')
replces=('xfpanel-switch')
source=("git://git.xfce.org/apps/xfce4-panel-profiles#tag=${pkgname}-${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}" #-${pkgver}"
  ./configure --prefix=/usr --python=python
  make
}

package() {
  cd "${srcdir}/${pkgname}" #-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
