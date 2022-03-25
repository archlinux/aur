
_pkgname=minq-nhentai
pkgname="${_pkgname}-git"
pkgver=r47.58ed2c8b1d13adc74ec409c0e2b9eabadb3dc0eb
pkgrel=1
epoch=
pkgdesc='Browse hnehtai in your terminal. Full image resolution in supported terminals.'
arch=(any)
url="https://github.com/kuche1/${_pkgname}.git"
license=('GPL')
groups=()
depends=(python python-beautifulsoup4 viu)
makedepends=(git)
checkdepends=()
optdepends=("wezterm: an example terminal that supports full image resolution",
            "python-minq-storage-git: needed for the beta 1",
            "python-minq-caching-thing-git: needed for beta 2")
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
	ln -s "/opt/${pkgname}/${_pkgname}-beta.py" "${pkgdir}/usr/bin/${_pkgname}-beta"
}
