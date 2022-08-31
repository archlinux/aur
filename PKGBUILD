# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname='erg-bin'
_pkgname="erg"
pkgver=0.3.2
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
sha256sums=('0e9cff375b221877ede48a591e3c9b7d6f6ff0de23cfd4907bf60fde47fa3de6'
            'f39baf693a13f41a9613d58fcd6c9c727363dc4c795ca7ec67d7e53e452457dd'
            'e9d7e9ef00763199a72ab55c6eb57a61d328c79324ba645bc577288599b0f9cf'
            '1acf7ea94ae9228781d0159660208b6740e113951e75a220b954d306cec7a579'
            'c3654883d4ece2bd1bdc61d206c6b3fdd9bdf87607cc8063c87f1b51602ad3fa')

package() {
	install -Dm755 erg -t "$pkgdir/usr/bin"
	install -Dm644 README{,_zh-CN,_zh-TW,_JA}.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 $startdir/LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname"
}
