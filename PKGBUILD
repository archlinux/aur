# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix-better-icon
pkgver=1.5.0
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (binary distribution). This release uses the default terminal icon of your theme."
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3' 'hicolor-icon-theme' 'libx11')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
conflicts=('terminix' 'terminix-git')
source_x86_64=(icon.patch ${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/${pkgver}/terminix.zip)
sha256sums_x86_64=('6b11252171a5167cf628a30d835a828b7fb4e88d5eec4b96b3b93084236ea2a5' 'ce36a228c3cbf4e8b8aaf454a334a0c288a3af74cd0eebe68006d52a6956a58a')

package() {
    patch $srcdir/usr/share/applications/com.gexperts.Terminix.desktop icon.patch
	cp -ar $srcdir/usr $pkgdir/usr
}
