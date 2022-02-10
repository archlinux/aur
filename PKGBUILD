# Maintainer: Léopold Ibghy Koprivnik <skwal.net@gmail.com>
pkgname=preserve-cd-git
pkgver=1.0.r.
pkgrel=1
epoch=
pkgdesc="The same as cd but preserves the current directory."
arch=(x86_64 i686)
url="https://github.com/SkwalExe/preserve-cd.git"
license=('MIT')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(preserve-cd)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd preserve-cd
	make
}

package() {
	cd preserve-cd
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	
}

