# Maintainer: Arctic Latent

pkgname=arctic-comfyui-helper-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='ComfyUI installer and model manager (prebuilt binary release)'
arch=('x86_64')
url='https://github.com/ArcticLatent/Arctic-Helper'
license=('custom')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libayatana-appindicator'
)
provides=('arctic-comfyui-helper')
conflicts=('arctic-comfyui-helper')

_asset="arctic-comfyui-helper-0.2.0-1-x86_64.pkg.tar.zst"
source_x86_64=("${url}/releases/download/v${pkgver}/${_asset}")
noextract=("${_asset}")
sha256sums_x86_64=('dbc833609027d778434f938a27f482363022d7a5634b7de966dd8e7fb6ff089f')

package() {
  bsdtar -xpf "${srcdir}/${_asset}" -C "${pkgdir}"
  rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"
}
