
# Maintainer: Your Name <youremail@domain.com>
pkgname=minq_xvideos-git
pkgver=r13.d983a5287e2bb755d0410ce54b3ca2e7160aab46
pkgrel=1
epoch=
pkgdesc="Watch xvideos in your terminal! Undesirable videos can be blocked!"
arch=(x86_64 i686)
url="https://github.com/kuche1/minq_xvideos.git"
license=('GPL')
groups=()
depends=(python python-beautifulsoup4 viu mplayer yt-dlp)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(minq_xvideos)
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

check() {
	cd "minq_xvideos"
	python3 --version
}

package() {
	cd "minq_xvideos"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -rf * "${pkgdir}/opt/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname}/minq_xvideos.py" "${pkgdir}/usr/bin/minq_xvideos"
}
