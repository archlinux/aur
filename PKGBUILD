# Maintainer: yrws <yrws@yrws.xyz>
_name='morgenrot'
pkgname="${_name}-git"
pkgver='v1.0.0'
pkgrel=2
pkgdesc='morgenrot calculates sunrise and sunset times'
arch=('any')
url="https://gitlab.com/yrws/morgenrot-cli"
license=('MIT')
groups=('yrws')
makedepends=('go' 'git' 'make')
provides=("$pkgname")
source=("git+https://gitlab.com/yrws/morgenrot-cli")
sha256sums=('SKIP')

build() {
	cd "${_name}-cli"
	make
}

package() {
	cd "${_name}-cli"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
