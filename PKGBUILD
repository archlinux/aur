# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='pythontexfigures'
pkgname="python-${_pkgname}"

pkgver=0.2.0
pkgrel=1
_commit_version='55bf83a495cf7b4f0d408fa834f430e3fcd5d95f'

pkgdesc='Embed matplotlib figures into LaTeX documents using PythonTeX'
arch=('any')
url='https://github.com/mje-nz/pythontexfigures'
_url_pypi='https://pypi.org/project/pythontexfigures'
license=('BSD')
depends=('python' 'python-matplotlib' 'python-pygments')
makedepends=('git' 'python-setuptools')
source=("git+${url}.git#commit=${_commit_version}")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'Readme.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
