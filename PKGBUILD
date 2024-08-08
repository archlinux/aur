# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=nitch
pkgver=0.1.6
_commit=1c6955c4632614797154487fdc0f983e60f20f06
pkgrel=3
pkgdesc="Incredibly fast system fetch written in nim"
arch=(x86_64)
url=https://github.com/unxsh/nitch
license=(MIT)
depends=(glibc)
makedepends=(nim git openssl-1.1)
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
