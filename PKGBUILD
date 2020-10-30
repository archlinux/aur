# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=ssh-audit
pkgver=2.3.1
pkgrel=2
pkgdesc="A tool for ssh server auditing."
arch=(any)
url="https://github.com/jtesta/ssh-audit"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jtesta/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('38656a2c93f7230a7aec760c4eca892fe1ce5977f482ff369db2812c1a87adcb4d3966bee1b0d59988666e3ab4416332448940ecd02518eb64407c0d8d793b3e')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 ssh-audit.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
