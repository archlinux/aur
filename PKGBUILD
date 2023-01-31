# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=minify-bin
_pkg="${pkgname%-bin}"
pkgver=2.12.4
pkgrel=1
pkgdesc="CLI implementation of the minify library package"
arch=('x86_64' 'aarch64')
url='https://github.com/tdewolff/minify'
license=('MIT')
provides=("$_pkg")
conflicts=("$_pkg")
optdepends=('bash: For auto-completions')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${_pkg}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${_pkg}_linux_arm64.tar.gz")
sha256sums_x86_64=('fbf8447ac46b6d1c084e59db662c1c7071af6e0925f5f8f722b5844d8136d59c')
sha256sums_aarch64=('45683698240868a10587ace9a9ba56b68f20bd9d51521dcaa714a6fd57557743')

package() {
  install -D "$_pkg" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 bash_completion "$pkgdir/usr/share/bash-completion/completions/$_pkg"
}
