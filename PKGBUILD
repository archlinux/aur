# Contributor: Vladimir Keleshev <vladimir [at] keleshev [dot] com>
# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid at gmail dot com>

_name=schema
pkgbase=python2-${_name}
pkgname=python2-${_name}
#pkgname=(python2-${_name} python-${_name})
pkgver=0.6.5
pkgrel=1
pkgdesc='Python library for validating Python data structures.'
arch=('i686' 'x86_64')
url="https://github.com/keleshev/${_name}"
license=('MIT')
makedepends=('python2-setuptools' 'python2-pytest')
#makedepends=('python-setuptools' 'python-pytest' 'python2-setuptools' 'python2-pytest')
source=("https://files.pythonhosted.org/packages/source/s/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b7494da450ce247fe8c7f2a8f9a73fbe5f1a634f64f734ce62aaba0708d76f0f')

check() {
  cd ${_name}-${pkgver}
  python2 setup.py test
  # python setup.py test
}

package_python2-schema() {
  depends=('python2')
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE-MIT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT
}

#package_python-schema() {
#  depends=('python')
#  cd "${srcdir}/${_name}-${pkgver}"
#  python setup.py install --root="${pkgdir}" --optimize=1
#  install -Dm644 LICENSE-MIT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT
#}
