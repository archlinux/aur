# Maintainer: edward-p <micro.fedora@gmail.com>
pkgname=deepin-wine-git
deepin_name=deepin-wine
pkgvers=2.18-2
pkgver=2.18_2
pkgrel=2
epoch=
pkgdesc="Deepin Wine"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
groups=()
depends=('deepin-wine32-git' 'deepin-wine32-preloader-git' 'deepin-wine32-tools-git'  'deepin-wine-binfmt-git' 'deepin-wine-helper-git' 'deepin-fonts-wine-git' 'deepin-libwine-git' 'deepin-wine-uninstaller-git' 'deepin-udis86-git' 'lib32-fontconfig' 'lib32-alsa-lib' 'lib32-mesa')
makedepends=('tar')
checkdepends=()
optdepends=('lib32-freetype2-infinality-ultimate: for better font view')
provides=()
conflicts=('deepin-wine')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/${deepin_name}/${deepin_name}_${pkgvers}_all.deb")
noextract=("${deepin_name}_${pkgvers}_all.deb")
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	ar -x ${deepin_name}_${pkgvers}_all.deb
	mkdir ${deepin_name}-${pkgvers}
	tar -xf data.tar.xz --directory="${deepin_name}-${pkgvers}"	
}

package() {
	cd "${deepin_name}-${pkgvers}"
	cp ./lib ./usr/ -rf
	rm ./lib -rf
	cp -r ./ ${pkgdir}/
}
