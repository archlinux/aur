# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>

_pkgname='flexx'
pkgname="python-${_pkgname}"
pkgver=0.8.1
pkgrel=1
pkgdesc='Write desktop and web apps in pure Python'
arch=('any')
url='https://github.com/flexxui/flexx'
license=('BSD')
depends=('python'
        'python-dialite'
        'python-pscript'
        'python-tornado'
        'python-webruntime')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a691f1f950efef17c37831a994c7e09c6fc24573b95a45439c2c8d1b6c765388')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
