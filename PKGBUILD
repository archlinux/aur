# Maintainer: javabetatester <birisesports@gmail.com>
pkgname=hydra-ensemble-bin
_pkgname=hydra-ensemble
pkgver=0.1.0
pkgrel=1
pkgdesc="Cross-platform multi-session terminal for Claude Code"
arch=('x86_64')
url="https://hydra-ensemble.xyz"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst')
optdepends=('github-cli: PR Inspector feature')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("Hydra.Ensemble-${pkgver}.AppImage::https://github.com/javabetatester/hydra-ensemble/releases/download/v${pkgver}/Hydra.Ensemble-${pkgver}.AppImage"
        "${_pkgname}.desktop")
sha256sums=('19cadb67e1f579683fd3ce9d88d6ed63c11117b3872a1a9f7d412312ca3bdb4f'
            '8d5c1c43ae342b523dd80a522161309d68737614955b6e852607aca71ff6e57d')
noextract=("Hydra.Ensemble-${pkgver}.AppImage")

package() {
  install -Dm755 "${srcdir}/Hydra.Ensemble-${pkgver}.AppImage" \
                 "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
