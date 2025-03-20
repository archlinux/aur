# Contributor: Rowisi < nomail <at> private <dot> com >
# Contributor: So1ar <so1ar114514@gmail.com>
# Contributor: Bot-wxt1221<3264117476@qq.com>
# Manitor: Jia Yin<lok-ation@outlook.com>

pkgname=hmcl-stable-bin
pkgver=3.6.11
pkgrel=2
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular."
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
depends=('java-runtime' 'gtk2')
provides=('hmcl')
conflicts=('hmcl')
source=("hmcl.desktop"
	"hmcl.png"
        "LICENSE::https://raw.githubusercontent.com/HMCL-dev/HMCL/refs/heads/main/LICENSE"
        "${pkgname}-${pkgver}-${pkgrel}.sh::https://github.com/HMCL-dev/HMCL/releases/download/release-${pkgver}/HMCL-${pkgver}.sh")
sha256sums=('a367a2d222dc86b3e3a60af0727192aa461922735825bf2ccab72a1d95c60325'
            '29120471641c51aae3ee84f8bcc16e1e4148c153085f71ccb9680415007f82ad'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '8899c702e3bd84d8556a590906a523360153db8ab99d1ac9400b9ba746394a99')

noextract=("${pkgname}-${pkgver}-${pkgrel}.sh")

package() {
  install -Dm755 "${pkgname}-${pkgver}-${pkgrel}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "hmcl.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
