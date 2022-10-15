# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname='erg-bin'
_pkgname="erg"
pkgver=0.5.9
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
sha256sums=('a7af991fffea8ec1fc5907d016225a941c5cac449e482eb47ac7512dfefe61a4'
            '4d0d323157176b28eb86e184b8c741fd2c92dbc41b1ba772a577fea5d259bae6'
            '3035486f4e6f2a9e22c65033899888e4abfb9efed9d6f6b7c69b115de0e2bfc0'
            'ee2e43dc09eeb73df437eacb213d0ced1ab956319db8ed8446141f8834be0e82'
            'f4c9fc6724c4a0cac7c579e0b6cd6d6f11e8d62cc18152fd99a5d6d6e7050c13')

package() {
	install -Dm755 erg -t "$pkgdir/usr/bin"
	install -Dm644 README{,_zh-CN,_zh-TW,_JA}.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 $startdir/LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname"
}
