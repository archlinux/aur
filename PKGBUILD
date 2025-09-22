# Maintainer: Kazoku <k4zoku@pm.me>
pkgname=hudkit-wayland
pkgver=4.1.0
pkgrel=1
epoch=0
pkgdesc="Transparent click-through web browser overlay, using WebKit (Wayland fork)"
arch=('x86_64')
url="https://github.com/SparxySys/hudkit-wayland"
license=('ISC')
depends=('gtk3' 'webkit2gtk' 'gtk-layer-shell')
makedepends=('make' 'pkgconf' 'gcc')
source=("hudkit-wayland::git+https://github.com/SparxySys/hudkit-wayland.git")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/hudkit-wayland/webkit"
	echo -e 'install:\n\tinstall -D -m 755 hudkit $(DESTDIR)/usr/bin/hudkit-wayland' >> makefile
}

build() {
    cd "${srcdir}/hudkit-wayland/webkit"
	make
}

package() {
	cd "${srcdir}/hudkit-wayland/webkit"
	make DESTDIR="$pkgdir" install
}
