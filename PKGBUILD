pkgname=nitchrevived
pkgver=0.1.7.5
_commit=59d778ff899c18ea4692420358d4d2e1c1656553
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
	cd "$pkgname/src"
	nimble build -d:danger --opt:speed -y -o:"$pkgname"
}

package() {
	cd "$pkgname/src"
	install -Dm755 -s -t "$pkgdir/usr/bin" "$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
