# Maintainer: Your Name <tom3451617@gmail.com>
pkgname=pickpx
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Get the color of a specific pixel on the screen via the command line (often used together with xdotool)."
arch=('x86_64')
url=""
license=('Unlicense')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('pickpx.c' 'LICENSE')
noextract=()
sha256sums=('487141138ec1a9cba67ec2eb5993066a2af00071b49468345f1b7f367fd28ab6'
            'b5065838cbac452dfc855ba6e6e031481ad2c68406f70d21ead9321374653e6c')
validpgpkeys=()

build() {
	gcc pickpx.c -o pickpx -lX11
}

package() {
	mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
	mkdir -p ${pkgdir}/usr/bin
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm755 pickpx ${pkgdir}/usr/bin
}
