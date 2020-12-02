# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pkgname='subprocrunner'
pkgname="python-${_pkgname}"
pkgver=1.2.1
pkgrel=2
pkgdesc='Python wrapper library for subprocess module'
arch=('any')
url='https://github.com/thombashi/subprocrunner'
_url_pypi='https://pypi.org/project/subprocrunner'
license=('MIT')
depends=('python' 'python-mbstrdecoder')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('446b0763ee6896f8e20e8a4484387c26e3ebd8ba586b84580c7e1fe75e469724')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
