pkgname=nitchrevived
pkgver=0.1.7.2
_commit=6656c2b9cc0886420f70d1cd6b4e2df6ecee43d5
pkgrel=3
pkgdesc="Incredibly fast system fetch written in nim! NiTch Revived is project supposed to continue the NiTch after it become not maintained."
arch=(x86_64)
url=https://git.teto.party/pkgs/nitchrevived
license=(MIT)
depends=(glibc)
makedepends=(nim git openssl-1.1)
source=("git+$url#commit=$_commit")
md5sums=(SKIP)

build() {
	cd "$pkgname"
	nimble build -d:release --opt:speed -y -o:"$pkgname"
}

package() {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" "$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
