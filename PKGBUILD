# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=nitch
pkgver=0.1.5
_commit=abf145c9366c9cda43aeb6d28e6fc944e383fadc
pkgrel=1
pkgdesc="Incredibly fast system fetch written in nim"
arch=(x86_64)
url=https://github.com/unxsh/nitch
license=(MIT)
makedepends=(nim git)
source=("git+$url#commit=$_commit")
md5sums=(SKIP)

build() {
	cd "$pkgname"
	nimble build
}

package() {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" "$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
