# Maintainer: Kazoku <k4zoku@pm.me>
_pkgname=hudkit-wayland
pkgname=${_pkgname}
pkgver=4.1.0
pkgrel=3
pkgdesc="Transparent click-through web browser overlay, using WebKit (Wayland fork)"
arch=('x86_64')
url="https://github.com/SparxySys/hudkit-wayland"
license=('ISC')
depends=('gtk3' 'webkit2gtk' 'gtk-layer-shell')
makedepends=('git' 'make' 'pkgconf' 'gcc')
_commit=10e8a409ecfb4253cbe3e794239ebd36da95706f
source=("${_pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('4cef2af8fbd5a2ff68cd3c74816f85772e673956416750a282f34ebc4583a060')

build() {
    cd "${srcdir}/${_pkgname}/webkit"
	make
}

package() {
	cd "${srcdir}/${_pkgname}/webkit"
	install -Dm755 hudkit "${pkgdir}/usr/bin/${_pkgname}"
}
