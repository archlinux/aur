# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-alibabacloud-nls-python-sdk-git
_pkgname=${pkgname%-git}
_gitname=${_pkgname/python-}
pkgver=2.0.0.r1.g5dc8484
pkgrel=1
pkgdesc="Alibaba Cloud Ali_Speech SDK for Python."
arch=('any')
url="https://github.com/aliyun/alibabacloud-nls-python-sdk"
license=('Apache')
depends=('python-requests'
         'python-websocket-client')
makedepends=('python-setuptools' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/aliyun/alibabacloud-nls-python-sdk")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_gitname

  python setup.py build
}

package() {
  cd $_gitname

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim: ts=2 sw=2 et:
