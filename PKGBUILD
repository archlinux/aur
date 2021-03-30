# Maintainer: xylzq
pkgname=cnkiexpress
pkgver=0.0.10
pkgrel=1
pkgdesc="cnki for arch"
arch=('i686' 'x86_64')
url="http://cajviewer.cnki.net/download.html"
license=('GPL')
groups=(cnkiexpress)
depends=(at-spi2-core  desktop-file-utils  gtk3  hicolor-icon-theme libappindicator-gtk3  libnotify  libsecret  libxss  libxtst  nss util-linux-libs  xdg-utils) 
makedepends=(yay debtap wget)
source=("https://download.cnki.net/"$pkgname"/"$pkgname"_"$pkgver"_amd64.deb")
sha512sums=("SKIP")
package() {
	sudo debtap -u
	sudo debtap $pkgname_$pkgver_amd64.deb
	sudo pacman -U $pkgname_$pkgver.pkg.tar.zst
}
