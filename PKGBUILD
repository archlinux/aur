pkgname=115pc
pkgver=1.0.6.7
pkgrel=1
epoch=
pkgdesc="115.com PC client"
arch=('x86_64')
url="https://pc.115.com/"
license=('Proprietary')
groups=()
depends=()
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=(
    "https://down.115.com/client/${pkgname}/lin/${pkgname}_${pkgver}.deb"
    "115.desktop"
    "115.sh"
)
noextract=()
sha256sums=(
    '6625074e2f1fe13528a58eeca5f96035a535861670c04f74c7b5ffc717e34533'
    'SKIP'
    'SKIP'
)
validpgpkeys=()

package() {
        tar -C ${srcdir} -xf data.tar.xz
	mkdir -p ${pkgdir}/opt/
	install -Dm644 ${srcdir}/115.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
        install -Dm644 ${srcdir}/usr/local/115/res/115.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/115pc.png
	cp -rT ${srcdir}/usr/local/115 ${pkgdir}/opt/${pkgname}
	install -Dm755 ${srcdir}/115.sh ${pkgdir}/opt/${pkgname}/115.sh
}
