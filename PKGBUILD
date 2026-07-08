# Maintainer: John Dalrymple <jdalrymple@users.noreply.github.com>

pkgname=minecraft-bedrock
pkgver=0.1.0
pkgrel=11
pkgdesc='User-level Steam Proton/GDK-Proton helper for Minecraft Bedrock'
arch=('x86_64')
url='https://www.minecraft.net/en-us/download'
license=('MIT')
depends=('bash' 'curl' 'libarchive' 'proton-ge-custom-bin' 'python' 'steam' 'winetricks')
optdepends=(
  'protonup-qt: manage additional Proton compatibility tools'
  'protontricks-git: inspect or manage Proton prefixes outside this helper'
)
install="${pkgname}.install"
source=(
  "${pkgname}"
  "${pkgname}-steam-shortcut.py"
  "${pkgname}.desktop"
  "${pkgname}.install"
  'README.md'
  'LICENSE'
)
sha256sums=('7363c4ee00532a4cd91c4e76cbb3b8775aa6f2a87714828478efb1772b86db8e'
            '7a2ee87d0d47deb537e1c171e61c0619fa1e962377e14355ef844d0f422bc3e4'
            'b03c8daf39b730be248a7866886f92e6943a2741e1e7d55b8f43b0f7b59bf8af'
            '48fa66703cd24f0e8b493894ebd44da6cdc2085887d3c2eaafc263c4dee3daaa'
            '72286ed9c28e73c7a664476e6f6c193c4be4ea55c8983abe4427dc93ae49896c'
            '4cd7f427d9043afe507b948a634904701432dbfda987ec1cf8282a0c9934f5e8')

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}-steam-shortcut.py" \
    "${pkgdir}/usr/lib/${pkgname}/steam-shortcut.py"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
