
# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Luis Braun <luis.braun07@gmail.com>
pkgname=qtile-config-git
pkgver=1.0.r6.b4b67b4
pkgrel=1
epoch=
pkgdesc="a qtile config"
arch=(x86_64)
url="https://github.com/luis-07/qtile-config"
license=('GPL')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()



pkgver() {
	cd "${_pkgname}"
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd qtile-config/core
	sudo cp -f qtile-config.py /usr/bin/qtile-config
}

package() {
    cd qtile-config

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
}
