# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pkgname=dockerfile-parse
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.0.14
pkgrel=1
arch=(any)
license=('BSD')
pkgdesc='Python library for parsing Dockerfile files.'
url='https://github.com/containerbuildsystem/dockerfile-parse'
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/containerbuildsystem/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e58012aaeaec469034b91797852ac898d058e474744afa61cf3745b8c8e5ed81480cfc15f7217a191b240568dcdf992037f9fc8ead223cc330398554020a7047')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

package_python-dockerfile-parse() {
  depends=('python-six')
  cd ${_pkgname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-dockerfile-parse() {
  depends=('python2-six')
  cd ${_pkgname}-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
