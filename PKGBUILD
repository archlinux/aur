# Maintainer Swissky <swisskysec@protonmail.com>
pkgname=payloadsallthethings-git
pkgbase=payloadsallthethings
pkgver=r232.928a454
pkgrel=1
pkgdesc="A list of useful payloads and bypass for Web Application Security and Pentest/CTF."
arch=('any')
url="https://github.com/swisskyrepo/PayloadsAllTheThings/"
license=('unknown')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname}")
conflicts=()
replaces=()
backup=()
options=()
install=
source=('payloadsallthethings-git::git+https://github.com/swisskyrepo/PayloadsAllTheThings.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	mkdir -p "${pkgdir}/usr/share/wordlists/${pkgname}"
	find "${srcdir}/${pkgname}" -maxdepth 1 | grep -v \\.git | xargs -I{} cp -r {} "${pkgdir}/usr/share/wordlists/${pkgname}"
}
