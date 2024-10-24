# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=diann-bin
_package=${pkgname%-bin}
pkgver=1.9.2
pkgrel=1
epoch=
pkgdesc="DIA-NN - a universal software for data-independent acquisition (DIA) proteomics data processing"
arch=('x86_64')
url="https://github.com/vdemichev/DiaNN"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("diann")
conflicts=("diann")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/vdemichev/DiaNN/releases/download/${pkgver}/${_package}-${pkgver}.Linux.zip")
noextract=()
sha256sums=('2ee0aa0a5f1fe7b9da909bc4b59561ed9871f9192c37a88865a4873695447c37')
validpgpkeys=()

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -Dt "${pkgdir}/opt/${_package}" "${srcdir}/${_package}-${pkgver}"/* 
	chmod +x "${pkgdir}/opt/${_package}/${_package}-linux"
	ln -s "/opt/${_package}/${_package}-linux" "${pkgdir}/usr/bin/${_package}"
}
