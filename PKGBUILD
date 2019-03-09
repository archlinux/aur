# Maintainer: N.E. Neal <spam at [part of name before neal without dots] dog com>
pkgname='bonsai.sh-git'
pkgver=r43.0c43085
pkgrel=1
pkgdesc="A randomly generated bonsai tree in your terminal!"
arch=('any')
url="https://gitlab.com/jallbrit/bonsai.sh"
license=('GPL3')
groups=()
depends=("bash")
makedepends=("git")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://gitlab.com/jallbrit/bonsai.sh.git")
noextract=()
md5sums=(SKIP)

pkgver() {
	cd $startdir/$pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd ${srcdir}/${pkgname}
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 bonsai.sh "$pkgdir/usr/bin/bonsai.sh"
	sudo ln -s /bin/bonsai.sh /bin/bonsai
}
