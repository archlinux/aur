# Maintainer: TTsdzb <ttsdzb at outlook dot com>
# Maintainer: Jia Yin<lok-ation at outlook dot com>

pkgname=hmcl-beta-bin
pkgver=3.6.12.274
pkgrel=1
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
        "${pkgname}-${pkgver}-${pkgrel}.sh::https://github.com/HMCL-dev/HMCL/releases/download/v${pkgver}/HMCL-${pkgver}.sh")
sha256sums=('ef5edb4285293c77162374e15f01f3540c7f511f6d9ab5b7244c4b01eb8512de'
            '29120471641c51aae3ee84f8bcc16e1e4148c153085f71ccb9680415007f82ad'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '5d7bda0562ed3fe3b9aa418289114dd94c5f008f520a27a0c3a6b04c4648aa1f')

noextract=("${pkgname}-${pkgver}-${pkgrel}.sh")

package() {
  install -Dm755 "${pkgname}-${pkgver}-${pkgrel}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "hmcl.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
