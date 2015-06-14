# Maintainer: Cedric Leporcq <cedl38 at gmail dot com>

pkgname=zen-gtk-themes
pkgver=0.16.0
pkgrel=1
pkgdesc="A gtk2/gtk3 theme for Xfce, LXDE and gnome that attempt to keep it simple, consistent and being visually appealing."
arch=('any')
url="http://opendesktop.org/content/show.php/Zen+suite?content=149883"
license=('GPL3')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('alinea-themes' 'mini-xfwm4-theme' 'xfce4-notifyd' 'gtk3>=3.8.0' 'libreoffice-patch.sh: script to increase sheet tabs for LibreOffice. See README or http://opendesktop.org/content/show.php/Zen+suite?content=149883 for more infos')

source=("$pkgname-$pkgver.tar.gz::https://github.com/cedl38/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('95aac1cd969a84065b4532ffdd153016')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
