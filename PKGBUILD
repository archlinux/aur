
# Maintainer: Your Name <youremail@domain.com>
pkgname=minq_stopwatch-git
pkgver=r3.dafa82bbab96551c5e9c64dd000cc0d941965d80
pkgrel=1
epoch=
pkgdesc="A terminal based timer that remembers where you left off"
arch=(x86_64 i686)
url="https://github.com/kuche1/minq_stopwatch.git"
license=('GPL')
groups=()
depends=(python)
makedepends=(git python python-pip)
checkdepends=()
optdepends=()
provides=(minq_stopwatch)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

prepare() {
	cd "minq_stopwatch"
}

build() {
	cd "minq_stopwatch"
}

check() {
	cd "minq_stopwatch"
	python3 --version
	pip3 --version
}

package() {
	#cd "$pkgname-$pkgver"
	#make DESTDIR="$pkgdir/" install
	cd "minq_stopwatch"
	pip3 install art
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -rf * "${pkgdir}/opt/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname}/minq_stopwatch.py" "${pkgdir}/usr/bin/minq_stopwatch"
}
