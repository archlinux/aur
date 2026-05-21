# Maintainer: marralesfios <marralesfios@gmail.com>
pkgname=cppp-git
pkgver=r127.b2079a9
pkgrel=2
pkgdesc="Miscellaneous C++ utilities and enhancements to the stdlib"
arch=('any')
url="https://github.com/marralesfios/cppp"
license=('unknown')
groups=()
depends=()
makedepends=('git')
provides=("cppp=${pkgver}")
conflicts=("cppp")
replaces=()
backup=()
options=()
install=
source=('cppp::git+https://github.com/marralesfios/cppp.git')
noextract=()
sha256sums=('SKIP')

pkgver(){
	printf "r%s.%s" "$(git -C cppp rev-list --count HEAD)" "$(git -C cppp rev-parse --short=7 HEAD)"
}

package(){
    pwd
	cd cppp
	mkdir -pm 755 $pkgdir/usr/include/cppp
	find . ! -path "*/.*" -type f -exec install -m 644 -D {} $pkgdir/usr/include/cppp/{} \;
}
