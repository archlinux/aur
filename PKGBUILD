
# Maintainer: nbebaw
pkgname=softphone-sipgate
pkgver=1.10
pkgrel=27
pkgdesc="SIPGATE"
arch=('any')
url="https://www.sipgateteam.de/softphone/download"
license=('MIT')
makedepends=('git'
	     'wget')
source=("https://gitlab.com/nbebaw/softphone.git")
md5sums=('SKIP')

package() {
	mkdir -p ${pkgdir}/opt
	wget https://sipgate-desktop-app.s3.eu-central-1.amazonaws.com/sipgate-softphone.AppImage -P ${pkgdir}/opt
	cd softphone
	install -Dm755 softphone ${pkgdir}/usr/bin/softphone
	install -Dm644 softphone.desktop ${pkgdir}/usr/share/applications/softphone.desktop
	install -Dm644 softphone.png ${pkgdir}/usr/share/pixmaps/softphone.png
}

