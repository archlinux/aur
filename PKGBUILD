# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname="reddio"
pkgver=0.4
pkgrel=1
epoch=
pkgdesc="a command-line interface for Reddit written in POSIX sh"
arch=("any")
url="https://gitlab.com/aaronNG/reddio"
license=("MIT")
groups=()
depends=("curl" "jq") 
makedepends=("git")
checkdepends=()
optdepends=("gnu-netcat: for authentication" "openbsd-netcat: for authentication" "bash: POSIX compliant shell" "dash: POSIX compliant shell" "ksh: POSIX compliant shell")
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://gitlab.com/aaronNG/reddio.git")
noextract=("git+https://gitlab.com/aaronNG/reddio.git")
sha256sums=("SKIP")

prepare() {
	cd "$srcdir/$pkgname"
	git checkout "v${pkgver}"
}

package() {
	cd "$srcdir/$pkgname"
	PREFIX="$pkgdir/usr/" make install
}
