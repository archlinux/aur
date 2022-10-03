# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname='erg-bin'
_pkgname="erg"
pkgver=0.5.0
pkgrel=1
pkgdesc="Statically typed language that can deeply improve the Python ecosystem"
url="https://github.com/erg-lang/erg"
license=('MIT' 'Apache')
arch=('x86_64')
conflicts=('erg-git' 'erg')
depends=('python')

source=("$_pkgname::https://yuioto-onedrive.vercel.app/api/raw/?path=/tmp/erg/bin/erg-v$pkgver-$arch"
	"https://raw.githubusercontent.com/erg-lang/erg/main/README.md"
	"https://raw.githubusercontent.com/erg-lang/erg/main/README_JA.md"
	"https://raw.githubusercontent.com/erg-lang/erg/main/README_zh-CN.md"
	"https://raw.githubusercontent.com/erg-lang/erg/main/README_zh-TW.md")
sha256sums=('ec4f2388bfd3a50cf98a71e7f4d46dee6510a6f6b4c4c1d89e9943a4560a49af'
            '4c17cf494d8fcbdd6bb84139b53eaa3fb43ff10ba713b3a6bc20c6e4bef58e0c'
            '2147b0e67bec769fffa0714d9d228d03a2f3019718178ec0a3b0a482795e6c46'
            '1957e61dea2b56a3296a8a5c1c5cb54d2dc6951d749fb5a42d462a3d26ef9482'
            'ad6c41844b3d565488592fb3c4bbb6e3a6ed1523317e218e09785370506ca2c8')

package() {
	install -Dm755 erg -t "$pkgdir/usr/bin"
	install -Dm644 README{,_zh-CN,_zh-TW,_JA}.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 $startdir/LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname"
}
