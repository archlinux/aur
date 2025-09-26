
# Maintainer: NovaDragon <me@novadragon.space>

pkgname=gdscript-formatter-bin
pkgver=0.9.1
pkgrel=1
pkgdesc=" A fast code formatter for GDScript and Godot 4, written in Rust "
arch=(x86_64)
url=https://github.com/GDQuest/GDScript-formatter
license=(MIT)
provides=('gdscript-formatter')
conflicts=('gdscript-formatter')
options=('!strip')
source=(
"https://github.com/GDQuest/GDScript-formatter/releases/download/$pkgver/gdscript-formatter-linux-x86_64.zip"
"https://raw.githubusercontent.com/GDQuest/GDScript-formatter/refs/tags/$pkgver/LICENSE")
sha256sums=('d2cc804bbadbfd9f2f276173d8073d9f1720929c7828bf24b0ca7b463bc24f89'
'dfbd41d6f39efbc96ca870f74f341f10ad44c1d66feca2049629917d19c2251c')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"

    install -Dm755 "gdscript-formatter-linux-x86_64" "${pkgdir}/opt/${pkgname}/gdscript-formatter"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/opt/${pkgname}/gdscript-formatter" "${pkgdir}/usr/bin/gdscript-formatter"
}
