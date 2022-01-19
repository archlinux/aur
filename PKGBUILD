
_pkgname=minq-nhentai
pkgname="${_pkgname}-git"
pkgver=r42.eca7872f6e1669e456d7f63adaad04d64ed3d29b
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
optdepends=("wezterm: an example terminal that supports full image resolution", "python-minq_storage-git: needed for the beta version")
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
