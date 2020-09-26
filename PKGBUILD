# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=dongbei
pkgver=0.0.6
pkgrel=1
pkgdesc="东北方言编程语言"
arch=('any')
url="https://github.com/zhanyong-wan/dongbei"
license=('MIT')
depends=('python-setuptools')
makedepends=('python-setuptools-scm')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/zhanyong-wan/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('91f5d5ab1bbec14e50acc73027b3e6ac852fade50fa06238b1e0e372eb4936e9')

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
