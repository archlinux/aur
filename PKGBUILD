# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=ani-cli-pystardust-git
pkgver=1.7_r.
pkgrel=1
epoch=
pkgdesc="A cli tool to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
groups=()
depends=('grep' 'sed' 'curl' 'openssl' 'mpv' 'aria2')
makedepends=(git)
checkdepends=()
optdepends=()
provides=(ani-cli)
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
	printf "1.7_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/${_pkgname%-VCS}"
        install -Dm755 ./ani-cli "$pkgdir/usr/bin/ani-cli"
}
