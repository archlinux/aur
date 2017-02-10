# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>
pkgname=kupfer
pkgver=304
pkgrel=1
pkgdesc="Launcher application written in python. Similar to Gnome-Do / Launchy"
arch=('i686' 'x86_64')
url="https://kupferlauncher.github.io"
license=('GPL3')
depends=('libkeybinder3' 'python-dbus' 'python' 'python-cairo' 'libwnck3' 'python-xdg')
makedepends=('intltool')
source=("https://github.com/kupferlauncher/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.xz")
sha1sums=('a2f8d10ee6d8e4c9a2a7437e0e6dea39338ac78d')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  export PYTHON="/usr/bin/python"
  ./waf configure --prefix=/usr \
                  --no-update-mime \
                  --no-update-icon-cache
  ./waf
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  ./waf install -f --destdir="${pkgdir}"
}




