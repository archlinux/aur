# Maintainer: Pieter Joost <pj@born2code.net>
pkgname=topalias
pkgver=2.0.15
pkgrel=1
pkgdesc="Linux bash/zsh alias generator and statistics from command history,"
arch=('any')
url="https://github.com/CSRedRat/topalias"
license=('GNU')
depends=('python')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('20ef08a1999e89647ba9afe6f120376b9387aabc2cf43594fc700c84acc4e1089e7022fd1b449685bf7443179a649957d32234dbc8b03d54c36eba7ee08d389f')

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
