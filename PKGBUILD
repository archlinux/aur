# Maintainer: Aleksander Heintz <alxandr@alxandr.me>

pkgname=eww-wayland
_pkgname=eww
pkgver=0.4.0
pkgrel=1
pkgdesc="A standalone widget system for wayland made in Rust."
url='https://github.com/elkowar/eww'
arch=(x86_64)
license=(MIT)
makedepends=(rustup git)
depends=(gtk3 gtk-layer-shell)
conflicts=(eww-git eww)
provides=(eww)
source=("git+${url}#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "${_pkgname}"
  cargo build --release --package eww --no-default-features --features wayland
}

package() {
  cd "${_pkgname}"
  install -Dm755 target/release/eww "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
