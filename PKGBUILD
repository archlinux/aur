# Maintainer: Muflone http://url.muflone.com/contacts

pkgname=cpucompare-git
pkgver=0.6.5.g9954046
pkgrel=1
pkgdesc="A GTK+ application to make comparisons between CPU models."
url="http://url.muflone.com/cpucompare"
arch=('any')
license=('GPL2')
depends=('python2' 'gtk3' 'python2-gobject' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('git')
provides=('cpucompare')
conflicts=('cpucompare')
source=("git+https://github.com/muflone/cpucompare.git")
md5sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "${pkgname%-*}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${pkgname%-*}"
  python2 setup.py build
}

package() {
  cd "${pkgname%-*}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}

