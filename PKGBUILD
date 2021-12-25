
_pkgname=minq_xvideos
pkgname="${_pkgname}-git"
pkgver=r17.709508d288055152f42e8197cf9d8ed2bffeb991
pkgrel=1
epoch=
pkgdesc="Explore xvideos in your terminal! Videos can be either played in the terminal or in any external video player. Undesirable videos can be blocked."
arch=(x86_64 i686)
url="https://github.com/kuche1/${_pkgname}.git"
license=('GPL')
groups=()
depends=(python python-beautifulsoup4 imagemagick viu yt-dlp mplayer)
makedepends=(git)
checkdepends=()
optdepends=("wezterm: terminal that supports sixel", "vlc: an alternative video player")
provides=("${_pkgname}")
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

package() {
	cd "${_pkgname}"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -rf * "${pkgdir}/opt/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname}/${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
}
