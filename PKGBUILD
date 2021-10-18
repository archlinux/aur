# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=diann
pkgver=1.8
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
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/vdemichev/DiaNN/releases/download/${pkgver}/${pkgname}_${pkgver}.deb"
        "https://raw.githubusercontent.com/vdemichev/DiaNN/master/LICENSE.txt")
noextract=()
sha256sums=("03efec31370b7be0cba9bcb60a99dacb42a818af031fd712df76b493c966e422"
            "SKIP")
validpgpkeys=()

package() {
	tar -zxvf data.tar.gz -C $pkgdir
	mkdir -pv $pkgdir/usr/bin
	ln -sv /usr/$pkgname/$pkgver/${pkgname}-${pkgver} $pkgdir/usr/bin/diann
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
