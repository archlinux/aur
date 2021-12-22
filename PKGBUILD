
_pkgname=minq_simple_https_file_hoster
pkgname="${_pkgname}-git"
pkgver=r5.df9983497f765b3e3464aa1d2472d62d889a79fd
pkgrel=1
epoch=
pkgdesc="Host files easily"
arch=(x86_64 i686)
url="https://github.com/kuche1/${_pkgname}.git"
license=('GPL')
groups=()
depends=(python python-pyopenssl)
makedepends=(git)
checkdepends=()
optdepends=()
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
