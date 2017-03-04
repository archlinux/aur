# Maintainer: Marcel Kleinfeller <marcel.kleinfeller at t-online dot de>

pkgname=terminix-better-icon
pkgver=1.5.2
pkgrel=1
pkgdesc="A tiling terminal emulator. This release uses the default terminal icon of your theme."
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('liblphobos' 'gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3' 'hicolor-icon-theme' 'libx11')
optdepends=('python2-nautilus: For "Open Terminix Here" support in nautilus')
conflicts=('terminix' 'terminix-git')
source_x86_64=(icon.patch ${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/${pkgver}/terminix.zip)
sha256sums_x86_64=('6b11252171a5167cf628a30d835a828b7fb4e88d5eec4b96b3b93084236ea2a5' 'd89c5c8a188c41d7d1d432f6345298b851feb778da9b2f1bba9cfb5e2cb239ed')

package() {
    patch $srcdir/usr/share/applications/com.gexperts.Terminix.desktop icon.patch
	cp -ar $srcdir/usr $pkgdir/usr
}
