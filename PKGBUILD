# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=cpucompare-git
pkgver=0.8.0
pkgrel=1
pkgdesc="A GTK+ application to make comparisons between CPU models."
url="https://www.muflone.com/cpucompare"
arch=('any')
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-xdg' 'gobject-introspection')
makedepends=('git')
provides=('cpucompare')
conflicts=('cpucompare')
source=("git+https://github.com/muflone/cpucompare.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${pkgname%-*}"
  python setup.py build
}

package() {
  cd "${pkgname%-*}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

