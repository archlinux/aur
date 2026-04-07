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
sha256sums_x86_64=('d291dcc99561068f040f5ebd4d46348a5aa1672a8a2378466507bbb3f8d52af1')

package() {
  bsdtar -xpf "${srcdir}/${_asset}" -C "${pkgdir}"
  rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"
}
