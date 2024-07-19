# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-webdavclient3
_gitname=webdav-client-python-3
pkgver=3.14.6
pkgrel=1
pkgdesc="Easy to use WebDAV Client for Python 3.x"
arch=('any')
url="https://github.com/ezhov-evgeny/webdav-client-python-3"
license=('custom')
depends=('python-requests'
         'python-lxml'
         'python-dateutil')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3132fd12436c4ea25c21a29fe7d97c317410c430157c52fa86e950f6966dac41')

build() {
  cd ${_gitname}-${pkgver}

  python setup.py build
}

package() {
  cd ${_gitname}-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim: ts=2 sw=2 et:
