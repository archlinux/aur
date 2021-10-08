# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=dongbei
pkgver=0.0.11
pkgrel=1
pkgdesc="东北方言编程语言"
arch=('any')
url="https://github.com/zhanyong-wan/dongbei"
license=('MIT')
makedepends=('python-setuptools-scm' 'python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/zhanyong-wan/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('896ea5f48a7b491f24858d5598531c76a4df899477d2b44ffe89328f9dd909c4')

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # license
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
# vim: set sw=2 ts=2 et:
