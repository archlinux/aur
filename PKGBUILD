
# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Luis Braun <luis.braun07@gmail.com>
pkgname=qtile-config-git
pkgver=1.0.r7.ecc93ad
pkgrel=1
epoch=
pkgdesc="qtile config"
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

package() {
	cd qtile-config/core
    install -Dm755 qtile-config.py "${pkgdir}"/usr/bin/qtile-config
}
