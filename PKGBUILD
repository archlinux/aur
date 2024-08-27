# Maintainer: Louis Dalibard <ontake@ontake.dev>
_pkgbase="ontake-himitsu"
pkgname="$_pkgbase-git"
pkgver=r10.g1840670
pkgrel=1
pkgdesc="A tiny command line 2FA TOTP client."
arch=("x86_64" "armv7h" "aarch64")
url="https://git.ontake.dev/go/himitsu"
license=('GPL3')
groups=()
depends=()
makedepends=('go>=1.18' 'git')
optdepends=()
provides=("$_pkgbase")
conflicts=("$_pkgbase")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://git.ontake.dev/go/himitsu")
noextract=()
md5sums=("SKIP") #autofill using updpkgsums

pkgver() {
	cd ${srcdir}/himitsu
	echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/himitsu"
	go mod tidy
	go build
}
	
package() {
	install -Dm755 "${srcdir}/himitsu/himitsu" "${pkgdir}"/usr/bin/ohimitsu
}
