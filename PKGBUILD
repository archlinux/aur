pkgname=nighterrors-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.0
pkgrel=1
pkgdesc='Ultra-light Rust Wayland blue-light filter daemon for Hyprland, Niri, and wlroots compositors'
arch=('x86_64')
url='https://github.com/OneNoted/nighterrors'
license=('Apache')
depends=('gcc-libs' 'glibc' 'wayland')
provides=("nighterrors=${pkgver}")
conflicts=('nighterrors' 'nighterrors-git')
_asset_name="${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu"
source=("${_asset_name}.tar.xz::${url}/releases/download/v${pkgver}/${_asset_name}.tar.xz")
sha256sums=('57469a790ab2026252a993ef2e4bf1b5e7436090706d092093388b3dcc3d702e')

package() {
  install -Dm755 \
    "${srcdir}/${_asset_name}/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 \
    "${srcdir}/${_asset_name}/README.md" \
    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 \
    "${srcdir}/${_asset_name}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
