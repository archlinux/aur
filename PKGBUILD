# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pkgname=fmf
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.7
pkgrel=1
arch=(any)
license=('GPL2')
pkgdesc='Flexible Metadata Format.'
url='https://github.com/psss/fmf'
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/psss/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c0ba80405acfd975184a1804485862454cccff187d0b0c5ae8dd656147cd9b48e69381829933f380611a84c6f4309f55e4ef7696b6291bea78e4eb623212f455')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

package_python-fmf() {
  cd ${_pkgname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-fmf() {
  cd ${_pkgname}-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
