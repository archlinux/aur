# Maintainer: wszqkzqk <wszqkzqk@gmail.com>
pkgname=deepin-wine
pkgvers=2.18-2
pkgver=2.18_2
pkgrel=5
epoch=
pkgdesc="Deepin Wine"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
groups=()
depends=('deepin-wine32' 'deepin-wine-helper' 'deepin-fonts-wine' 'deepin-libwine' 'deepin-wine-uninstaller' 'deepin-udis86' 'lib32-fontconfig' 'lib32-alsa-lib' 'lib32-mesa' 'fontconfig' 'lcms2' 'lib32-lcms2' 'libxml2' 'lib32-libxml2' 'libxcursor'  'libxrandr' 'lib32-libxrandr' 'libxdamage' 'lib32-libxdamage' 'libxi' 'lib32-libxi' 'gettext' 'lib32-gettext' 'freetype2' 'lib32-freetype2' 'glu' 'lib32-glu' 'libsm' 'lib32-libsm' 'gcc-libs' 'lib32-gcc-libs' 'libpcap' 'lib32-libpcap' 'desktop-file-utils')
makedepends=('tar' 'p7zip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/${pkgname}/${pkgname}_${pkgvers}_all.deb")
noextract=("${pkgname}_${pkgvers}_all.deb")
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${pkgvers}_all.deb
	mkdir ${pkgname}-${pkgvers}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgvers}"	
}

package() {
	cd "${pkgname}-${pkgvers}"
	cp ./lib ./usr/ -rf
	rm ./lib -rf
	cp -r ./ ${pkgdir}/
}
