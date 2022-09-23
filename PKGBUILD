# Maintainer: Goncalo Azevedo <goncalo.r.azevedo at tecnico dot ulisboa dot pt>
# Inspired from https://aur.archlinux.org/packages/po-uilib, only simplified year versioning because pkgver is too cursed
# Once installed you just need to add /usr/share/java/po-uilib.jar to your CLASSPATH
pkgname=po-uilib22
pkgver=202209081626
pkgrel=1
pkgdesc="UI library for the Fall semester of the 2022 PO course at IST university"
arch=(x86_64)
url="https://web.tecnico.ulisboa.pt/~david.matos/w/pt/index.php/Programa%C3%A7%C3%A3o_com_Objectos"
license=("CC BY-NC-ND 4.0")
depends=("java-environment")
_pkgname="Po-uilib"
_pkgpath="5/50"
_jarname="${pkgname::-2}"
source=("https://web.tecnico.ulisboa.pt/~david.matos/w/pt/images/$_pkgpath/$_pkgname-$pkgver.tar.bz2")
sha256sums=("5a471fcf53a4a7d2ddede75a78ad0174e45abdf27f61e64b0a3da6d81fedb4d0")

build() {
	cd "$srcdir/${_jarname}-$pkgver"

	make
}

package() {
	mkdir -p "$pkgdir/usr/share/java"
	cp "$srcdir/${_jarname}-$pkgver/${_jarname}.jar" "$pkgdir/usr/share/java/${_jarname}.jar"
}
