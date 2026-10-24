
# Maintainer: Derek R. Greene <derek@derekrgreene.com>

pkgname=gdscript-formatter-bin
pkgver=0.27.0
pkgrel=1
pkgdesc=" A fast code formatter for GDScript and Godot 4, written in Rust "
arch=(x86_64)
url=https://github.com/GDQuest/GDScript-formatter
license=(MIT)
provides=('gdscript-formatter')
conflicts=('gdscript-formatter')
options=('!strip')
source=(
"https://github.com/GDQuest/GDScript-formatter/releases/download/$pkgver/gdscript-formatter-$pkgver-linux-x86_64.zip"
"https://raw.githubusercontent.com/GDQuest/GDScript-formatter/refs/tags/$pkgver/LICENSE")
sha256sums=('56c8b7566b6ba6eb8738156ca13b2e93c2489b66a15ae6070aea0321d37a5323'
'67146754f0389e447766f19c6da7ce0f79eb13ea8442a8e2875f22c8844eff78')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"

    install -Dm755 "gdscript-formatter-$pkgver-linux-x86_64" "${pkgdir}/opt/${pkgname}/gdscript-formatter"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/opt/${pkgname}/gdscript-formatter" "${pkgdir}/usr/bin/gdscript-formatter"
}
