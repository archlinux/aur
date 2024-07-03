# Maintainer: Peter <peter@nexoid.at>
pkgname=mosh-scheme
pkgver=0.2.9_rc1
pkgrel=2
epoch=
pkgdesc="Mosh is a free and fast interpreter for Scheme as specified in the R6RS."
arch=(x86_64 i686)
url="https://github.com/higepon/mosh"
license=('unknown')
groups=()
depends=(oniguruma)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("https://github.com/higepon/mosh/releases/download/mosh-${pkgver/_/-}/mosh-${pkgver/_/-}.tar.gz")
sha256sums=('9f11bd36e128e3f9990662b7b4a6bcf41ae325d41c538467b2ef0f0f574b841f')
noextract=()
validpgpkeys=()

build() {
	cd "mosh-${pkgver/_/-}"
	./configure --prefix=/usr --program-suffix=-scheme
	make
}

# check() {
# 	cd "mosh-$pkgver"
# 	make -k check
# }

package() {
	cd "mosh-${pkgver/_/-}"
	make DESTDIR="$pkgdir/" install
}
