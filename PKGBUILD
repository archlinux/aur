# Maintainer: William Brown
pkgname="thrive-launcher-bin"
pkgver="1.1.2"
pkgrel="1"
arch=("x86_64")
pkgdesc="A desktop application that manages downloading and installing the game releases."
url="https://revolutionarygamesstudio.com/"
source=("https://github.com/Revolutionary-Games/Thrive-Launcher/releases/download/$pkgver/thrive-launcher_${pkgver}_amd64.deb")
noextract=("thrive-launcher_${pkgver}_amd64.deb")
md5sums=("60ad74fb0ca6ad25c87bb58dcd7422f6")
license=("GPL")
prepare() {
	cd "$srcdir"
	ar -xf "thrive-launcher_${pkgver}_amd64.deb"
	rm debian-binary control.tar.gz
	bsdtar -xf data.tar.xz
	rm data.tar.xz
}
package() {
	cp -R "$srcdir/opt" "$pkgdir"
	cp -R "$srcdir/usr" "$pkgdir"
}
