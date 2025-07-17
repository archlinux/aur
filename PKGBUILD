# Maintainer: Sumit Khatri <sumit.SwayKh@gmail.com>

pkgname="linksym"
pkgver=0.1.7
pkgrel=1
pkgdesc="A Dotfiles management tool, helps in tracking and creating Symlinks."
arch=("x86_64")
url="https://github.com/SwayKh/$pkgname"
license=("MIT")
depends=()
makedepends=("git" "go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("SKIP")

build() {
	cd "$pkgname-$pkgver"
	go build
}

package() {
  cd "$pkgname-$pkgver"

  # bin
  install -Dm755 ./$pkgname "$pkgdir"/usr/bin/$pkgname

  # license
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # README
  install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
