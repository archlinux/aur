# Maintainer: prg <prg-archlinux@xannode.com>
_name=urlgrabber
pkgname=python2-urlgrabber
pkgver=4.1.0
pkgrel=1
pkgdesc="A high-level cross-protocol url-grabber"
arch=('any')
url="https://github.com/rpm-software-management/urlgrabber"
license=('LGPL')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/u/urlgrabber/urlgrabber-${pkgver}.tar.gz")
sha512sums=('0e45491a2cd575978eea8a0a70a312d838b729391ae19363d3edc0073a0694f1648726e7e710d7928aaef5abc2141b8f45c5a0af931f3892fb208f5ccbe1a696')

build() {
  cd "urlgrabber-$pkgver"
  python2 setup.py build
}

package() {
  cd "urlgrabber-$pkgver"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
}
