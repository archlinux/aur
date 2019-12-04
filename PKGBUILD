# Maintainer: Denis Alevi <mail at denisalevi dot de>

pkgname=dpt-rp1-py
_name=${pkgname}
pkgver=0.1.6
pkgrel=1
pkgdesc='Python package to manage a Sony DPT-RP1'
url='https://github.com/janten/dpt-rp1-py'
arch=('any')
license=('MIT')
depends=('python-httpsig' 'python-requests' 'python-pbkdf2' 'python-urllib3' 'python-yaml' 'python-anytree' 'python-fusepy' 'python-zeroconf')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://github.com/janten/dpt-rp1-py/archive/v$pkgver.tar.gz")
md5sums=('301cd2a1606c50aff3e9141e96d2ba7f')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}" --skip-build
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}

# vim:set sw=2 sts=2 et:
