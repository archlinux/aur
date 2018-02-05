# Maintainer: Gui||aume <michaudg@gmail.com>

pkgname=rocketchat-client-bin
pkgver=2.10.4
pkgrel=1
pkgdesc="The Ultimate Open Source Web Chat Platform"
arch=('x86_64')
license=('The MIT License (MIT)')
url="https://rocket.chat"
options=()

source_x86_64=("https://github.com/RocketChat/Rocket.Chat.Electron/releases/download/${pkgver}/rocketchat_${pkgver}_amd64.deb")
md5sums_x86_64=('60cf7afd5cfefdb71ecf20558b8d1880')

depends=('libnotify' 'gconf' 'libxss')
optdepends=()

package() {
	cd "${srcdir}"

	tar xf data.tar.xz -C "${pkgdir}"

	chmod 755 $pkgdir/opt
	chmod 755 $pkgdir/usr
	chmod 755 $pkgdir/usr/share
	chmod 755 $pkgdir/usr/share/applications

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/Rocket.Chat+/rocketchat ${pkgdir}/usr/bin
}

