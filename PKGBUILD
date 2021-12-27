
_pkgname=minq_nhentai
pkgname="${_pkgname}-git"
pkgver=r14.4fbac5f50f10bfe9f6d0c51308703cf52ae77e83
pkgrel=1
epoch=
pkgdesc='Browse hnehtai in your terminal. Sixel support for full image resolution (your terminal needs to support sixel).'
arch=(x86_64 i686)
url="https://github.com/kuche1/${_pkgname}.git"
license=('GPL')
groups=()
depends=(python python-beautifulsoup4 viu)
makedepends=(git)
checkdepends=()
optdepends=("wezterm: an example terminal that supports sixel, for full image resolution")
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
