# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=minify-bin
pkgver=2.11.1
pkgrel=1
pkgdesc="CLI implementation of the minify library package"
arch=('x86_64')
url='https://github.com/tdewolff/minify'
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
optdepends=('bash: For auto-completions')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/minify_linux_amd64.tar.gz")
sha256sums=('826cb78ddc91f61553399b8649fabab816bb90e8e43d8c111fff462ee331e4c5')

package() {
  install -D minify -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 bash_completion "$pkgdir/usr/share/bash-completion/completions/minify"
}
