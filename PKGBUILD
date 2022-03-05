# Maintainer: zzjzxq33 <wojiushixxx at 126 dot com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=bbg
pkgver=20220304
pkgrel=1
pkgdesc="A static blog generator built with electron"
arch=('any')
url="https://github.com/baiyang-lzy/bbg"
license=('Unlicense')
depends=('gtk3' 'libxcb' 'electron')
conflicts=('bbg-git')
source=(
	"bbg"
	"icon.png"
	"bbg.desktop"
	"app.asar"::"${url}/releases/download/${pkgver}/app.asar"
)
sha256sums=(
	'9bb48fe10ec7b1b669546d185a98976b822b50fbcbaf0dd5faf0c162e8346a21'
	'b2055c02386eacb33fff9f53b2c1bf099d49e4c63d016704a220e9108ded262f'
	'd57c7e1126b2b168f2dd6debd2e77f069379c244b0ed7393eebffc2f2aa0d8be'
	'cc2636f9288ab1e44a12bbf386d34d5c1a56221943394dd9ae076facfadc8ab9'
)

package() {
	cd ${srcdir}/
	install -dm755 ${pkgdir}/usr/lib/${pkgname}
	install -Dm644 app.asar     ${pkgdir}/usr/lib/${pkgname}/app.asar
	install -Dm755 bbg          ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 bbg.desktop  ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm644 icon.png     ${pkgdir}/usr/share/icons/${pkgname}.png
}
