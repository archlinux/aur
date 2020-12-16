# Maintainer: Pieter Joost <pj@born2code.net>
pkgname=topalias
pkgver=2.0.14
pkgrel=1
pkgdesc="Linux bash/zsh alias generator and statistics from command history,"
arch=('any')
url="https://github.com/CSRedRat/topalias"
license=('GNU')
depends=('python3')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('ba04c98d57101e7f8c184c1afe1e95ab561e95499d652726ab512bbb1e2d6525d700f2a14ddbe3c0f07f130f23bf73410436cab0cec12e37a1ffbf325ee5012a')

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
