# Contributor: Richard PALO <richard.palo@free.fr>
_base=GooCalendar
pkgname=python-${_base@L}
pkgver=0.8.0
pkgrel=2
pkgdesc="A calendar widget for GTK using PyGoocanvas"
arch=('any')
url="http://${_base@L}.tryton.org/"
license=('GPL')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('goocanvas>=2.0' 'gdk-pixbuf2' 'gtk3')
source=("https://pypi.io/packages/source/$(expr ${_base@L}|cut -c1)/${_base@L}/${_base}-${pkgver}.tar.gz")
sha512sums=('92828ecfd3e5124249c807c53cb8b8ca2a4f146f676033b1a172a0fac415ff444d57c5c4de77e55046657b0c6f675902b408b205ad7125d6459c7babead871fa')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  python -m installer --destdir="${pkgdir}/" dist/*.whl
}
