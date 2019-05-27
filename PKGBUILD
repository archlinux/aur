# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfce4-panel-profiles
pkgver=1.0.8
pkgrel=1
pkgdesc="Simple application to manage Xfce panel layouts"
arch=('any')
url="https://git.xfce.org/apps/xfce4-panel-profiles/about/"
license=('GPL3')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'gtk3' 'python-gobject')
makedepends=('intltool' 'git')
conflicts=('xfpanel-switch')
replces=('xfpanel-switch')
source=("https://archive.xfce.org/src/apps/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a69e20f5e637319e14898b5c13ff7ba31d001a6e38e7516d70dbfd7600ad72db')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --python=python
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
