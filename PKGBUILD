# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>

pkgname=elixir-build
pkgver=20141001
pkgrel=1
pkgdesc="Compile and install different versions of Elixir"
arch=('any')
depends=('erlang')
optdepends=('git: install Elixir from git')
url="https://github.com/mururu/elixir-build"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/mururu/$pkgname/tar.gz/v$pkgver)
sha256sums=('825637780a580b7ebe8c5265a43d37ceff9f3876e771aa2f824079e504ad7347')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  msg 'Installing...'
  PREFIX="$pkgdir/usr" ./install.sh
}
