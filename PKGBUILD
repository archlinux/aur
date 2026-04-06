# Maintainer: Arctic Latent

pkgname=arctic-comfyui-helper-bin
pkgver=0.2.1
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

_asset="arctic-comfyui-helper-0.2.1-1-x86_64.pkg.tar.zst"
source_x86_64=("${url}/releases/download/v${pkgver}/${_asset}")
noextract=("${_asset}")
sha256sums_x86_64=('aad2e4ef671642ba5b9ee7e11015f6fc0620ae41c373708f869b0a7a7618d9da')

package() {
  bsdtar -xpf "${srcdir}/${_asset}" -C "${pkgdir}"
  rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"
}
