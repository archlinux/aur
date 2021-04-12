# Maintainer: Pieter Joost <pj@born2code.net>
pkgname=topalias
pkgver=2.0.20
pkgrel=1
pkgdesc="Linux bash/zsh alias generator and statistics from command history,"
arch=('any')
url="https://github.com/CSRedRat/topalias"
license=('GNU')
depends=('python')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('8c2c5d0e79ba0155e75c362b3c27ee36dff3d965609e14ba1bfef9a5e7fcd399d6309934c494ed59fc41cc56a68c4ef47f0c96c6684eefd802656b05d782ba93')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
}

install() {
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
