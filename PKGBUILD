# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-tencentcloud-sdk-python-git
_pkgname=${pkgname/python-}
_gitname=${_pkgname%-git}
pkgver=3.0.5.r275.ge27fede
pkgrel=1
pkgdesc="Tencent Cloud API 3.0 SDK for Python."
arch=('any')
url="https://github.com/tencentcloud/tencentcloud-sdk-python"
license=('Apache')
depends=('python')
makedepends=('git' 'python-setuptools')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+https://github.com/tencentcloud/${_gitname}")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
