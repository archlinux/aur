# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=netease-music
pkgver=0.9.0
pkgrel=1
epoch=
pkgdesc="Netease Cloud Music"
arch=('x86_64')
url="http://music.163.com/"
license=('unknown')
groups=()
depends=('qt5-multimedia' 'nss' 'libxss' 'taglib' 'qt5-x11extras' 'gcc-libs-multilib' 'gtk2')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=netease-music.install
changelog=
source=("http://s1.music.126.net/download/pc/netease-cloud-music_${pkgver}-1_amd64.deb")
noextract=("WineQQ7.8-${pkgver}-Longene.deb")
md5sums=('SKIP')

prepare() {
	ar -x "netease-cloud-music_${pkgver}-1_amd64.deb"
	mkdir "${pkgname}-${pkgver}"
	tar -Jxf data.tar.xz --directory="${pkgname}-${pkgver}"	
}

package() {
	cd "${pkgname}-${pkgver}"
	find ./usr -type f -exec install -Dm644 {} \
            "${pkgdir}/{}" \;
}
