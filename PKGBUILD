# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=dongbei
pkgver=0.0.13
pkgrel=1
pkgdesc="东北方言编程语言"
arch=('any')
url="https://github.com/zhanyong-wan/dongbei"
license=('MIT')
makedepends=('python-setuptools-scm' 'python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/zhanyong-wan/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4b5b9532d29be6013e184c8ce0221ff3693489b1429626819b18882984c6b549')

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
