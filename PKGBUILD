# Maintainer: Alexander Rundberg <alexanderrundberg [at] fastmail [dot] jp>
# Maintainer: Ryan O'Beirne <ryanobeirne [at] ryanobeirne [dot] com>
pkgname=pretty-git-prompt
pkgver=0.2.1
pkgrel=1
pkgdesc="Pretty git status for your shell prompt"
arch=('any')
url="https://github.com/TomasTomecek/pretty-git-prompt"
license=('MIT')
depends=('git')
makedepends=('rust' 'cmake')
source=("https://github.com/TomasTomecek/pretty-git-prompt/archive/$pkgver.tar.gz")
sha256sums=('56e1228209aa1e7d632ad98ca5d044dbf4d7c04d7b2cdea9132c3c3f759df93c')

build() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make exec-stable-build
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  install -Dm755 target/release/pretty-git-prompt "$pkgdir"/usr/bin/pretty-git-prompt
}
