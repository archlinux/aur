# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=modmanager-git
pkgver=r189.4688a28
pkgrel=1
pkgdesc="A Qt-based mod manager for minecraft."
arch=(x86_64)
url="https://github.com/kaniol-lck/modmanager"
license=('GPL')
groups=()
depends=(qt5-base)
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('modmanager::git+https://github.com/kaniol-lck/modmanager.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
}
