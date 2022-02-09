# Maintainer: Slips slipfox(underscore)xyz(at)riseup(dot)net
_pkgname=virm
pkgname=${_pkgname}-git
pkgver=r3.053c1a4
pkgrel=1
pkgdesc="A simple bash bulk removal tool, similar to vimv"
arch=('i386' 'x86_64')
url="https://git.envs.net/Slips/virm"
license=('GPL3')
groups=()
depends=()
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("${_pkgname}::git+${url}.git")
noextract=()
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "$srcdir/${_pkgname}"
	install -Dm755 "virm" ${pkgdir}/usr/bin/virm
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
