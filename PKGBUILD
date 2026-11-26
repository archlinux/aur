# Maintainer: robertfoster
pkgname=tubeglass-bin
_pkgname="${pkgname%-bin}"
pkgver=0.3.0 # renovate: datasource=github-releases depName=flawlesscode254/TubeGlass
pkgrel=1
pkgdesc="YouTube, YouTube Music and podcast desktop client, no account or API key needed"
arch=('x86_64' 'aarch64')
url="https://github.com/flawlesscode254/TubeGlass"
license=('MIT')
depends=('alsa-lib' 'ffmpeg' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libxkbcommon')
optdepends=('libx11: X11 support'
  'wayland: Wayland support'
  'xdg-desktop-portal: native file dialogs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")

package() {
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/doc/${_pkgname}/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -r "${pkgdir}/usr/share/doc"
}

sha256sums_x86_64=('15b260562d7ef36cf52410a2e1d2af2d5141f5eabfb3f1454a916d3ffaa70ae4')
sha256sums_aarch64=('9971599775f2e50e683656eeb15d154dd7360f979fc3557078de4364f29f8a8c')
