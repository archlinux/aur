# Maintainer: Arctic Latent

pkgname=arctic-comfyui-helper-bin
pkgver=0.2.5
pkgrel=1
pkgdesc='ComfyUI installer and model manager (prebuilt binary release)'
arch=('x86_64')
url='https://github.com/ArcticLatent/Arctic-Helper'
license=('custom')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libayatana-appindicator'
  'xdg-desktop-portal-gtk'
)
provides=('arctic-comfyui-helper')
conflicts=('arctic-comfyui-helper')

_asset="arctic-comfyui-helper-0.2.5-1-x86_64.pkg.tar.zst"
source_x86_64=("${url}/releases/download/v${pkgver}/${_asset}")
noextract=("${_asset}")
sha256sums_x86_64=('6963a128505feb37f3637e076df9af95a06026cf50278b59d3f3903d048324b3')

package() {
  bsdtar -xpf "${srcdir}/${_asset}" -C "${pkgdir}"
  rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"
}
