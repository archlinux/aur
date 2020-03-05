# Maintainer: Dadoum <contact@dadoum.ml>
pkgname=checkra1n
pkgver=0.9.8.1
pkgrel=3
pkgdesc="A community project to provide a high-quality semi-tethered jailbreak to all, based on the ‘checkm8’ bootrom exploit. "
arch=('x86_64')
url="https://checkra.in/"
license=('unknown')
groups=()
depends=('glibc>=2.24' 
	'ncurses5-compat-libs>=6.0' 
	'pango>=1.37.0'   
	'atk>=2.15.0' 
	'gdk-pixbuf2>=2.30.0' 
	'glib2>=2.45.0' 
	'fontconfig>=2.11.1' 
	'freetype2>=2.2.1' 
	'gtk3>=3.18.0' 
	'libusb>=1.0.19-2' 
	'libusbmuxd>=2.0.0-2' 
	'libplist>=2.1.0' 
	'libirecovery-git>=1.0.0' 
	'usbmuxd>=1.1.0')
makedepends=('tar' 'binutils')
checkdepends=()
optdepends=()
replaces=('checkra1n-ubuntu-bin')
backup=()
options=()
install=
changelog=
source=("https://assets.checkra.in/debian/checkra1n_"$pkgver"-"$pkgrel"_amd64.deb")
noextract=('checkra1n_"$pkgver"-"$pkgrel"_amd64.deb')
sha256sums=('8723dd54778c6b5b8e8b17b638ef2530cd0c4c20f1c187ef8ad19ebfa2e98b11')
validpgpkeys=()
options=('!strip')

prepare() {
	ar xf checkra1n_"$pkgver"-"$pkgrel"_amd64.deb
	rm debian-binary control.tar.gz
}

package() {
	mkdir -p $pkgdir
	tar xf data.tar.xz -C "$pkgdir"         
        rm data.tar.xz
}
