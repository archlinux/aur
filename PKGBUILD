# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

_pkgname=requests-futures
pkgname="python-${_pkgname}"
pkgver=1.0.0
pkgrel=1
pkgdesc='Asynchronous Python HTTP Requests for Humans'
arch=('any')
url='https://github.com/ross/requests-futures'
license=('APACHE')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
provides=("${pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('35547502bf1958044716a03a2f47092a89efe8f9789ab0c4c528d9c9c30bc148')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.rst'
}

# vim: ts=2 sw=2 et:
