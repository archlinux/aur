# Maintainer: Sayedul Sayem <sayedulsayem@gmail.com>

pkgname=whatsapp-linux-desktop-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="An unofficial WhatsApp Linux Desktop application"
arch=('x86_64')
url="https://github.com/sayedulsayem/whatsapp-linux-desktop"
license=('MIT')
conflicts=('whatsapp-linux-desktop')
depends=('electron' 'libxss' 'nss' 'libxtst' 'libnotify' 'libappindicator-gtk3')
source=("whatsapp-linux-desktop-${pkgver}-amd64.deb::$url/releases/download/v$pkgver/whatsapp-linux-desktop-$pkgver-amd64.deb")
sha256sums=('12f00de367cbf21729b18125d8d47a828dc835d7e97ae9e9df73de4691e19c36')

package() {
	bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/whatsapp-linux-desktop/whatsapp-linux-desktop" "${pkgdir}/usr/bin"
}