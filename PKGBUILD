# Maintainer: Lucas de Almeida Carotta <lucas.carotta@outlook.com>
pkgname=shojo-git
pkgver=0.0.3
pkgrel=1
epoch=
pkgdesc="Shojo is a CLI LaTex package manager"
arch=(x86_64 i686)
url="https://github.com/Fazendaaa/Shojo/"
license=('GPL')
groups=()
depends=()
makedepends=(git go)
checkdepends=()
optdepends=()
provides=(shojo)
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

build() {
	cd Shojo
	make
}

check() {
	cd Shojo
	make -k check
}

package() {
	cd Shojo
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX=/usr DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
