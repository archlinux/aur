# Maintainer: Alexandre Leuck <aleuck2004@gmail.com>
pkgname=iiufrgs
pkgver=r157.4ae3cb8
pkgrel=1
pkgdesc="A package of LaTeX classes for INF/UFRGS"
arch=('any')
url="https://github.com/schnorr/iiufrgs/"
license=('GPL')
groups=()
depends=('texlive-bin')
makedepends=('pkgconfig' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=iiufrgs.install
changelog=
source=("git://github.com/schnorr/iiufrgs.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	make INSTALLDIR="$pkgdir/usr/share/texmf/" install > /dev/null
}
