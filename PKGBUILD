# Maintainer: Alexander Rundberg <alexanderrundberg [at] fastmail [dot] jp>
# Maintainer: Ryan O'Beirne <ryanobeirne [at] ryanobeirne [dot] com>
pkgname=pretty-git-prompt
pkgver=0.2.2
pkgrel=1
pkgdesc="Pretty git status for your shell prompt"
arch=('any')
url="https://github.com/TomasTomecek/pretty-git-prompt"
license=('MIT')
depends=('git')
makedepends=('rust' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TomasTomecek/pretty-git-prompt/archive/$pkgver.tar.gz")
sha256sums=('189f2c05e8e1a7bb3b68b71b235c156022086b4cefe8a5521cc5182f64835871')

build() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make exec-stable-build
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  install -Dm755 target/release/pretty-git-prompt "$pkgdir"/usr/bin/pretty-git-prompt
}
