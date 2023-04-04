# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall
pkgver=0.5.12
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.umaneti.net/chwall/about/"
license=("custom:WTFPL")
depends=("gdk-pixbuf2" "gobject-introspection-runtime" "gtk3"
         "hicolor-icon-theme" "procps-ng" "python" "python-cssselect"
         "python-gobject" "python-importlib-metadata" "python-lxml"
         "python-pillow" "python-requests" "python-setuptools" "python-xdg"
         "python-yaml")
makedepends=("imagemagick")
optdepends=('imagemagick: to extract wallpaper size in nitrogen mode'
            'libnotify: to send notification when wallpaper change'
            'nitrogen: to apply wallpaper on independant desktop manager'
            'xorg-xrandr: to extract screen config in nitrogen mode')
source=("https://git.umaneti.net/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2c921aa0749a77f27075efad96a880a8ea15d7a442e9667dfccca6df88b97401')

package() {
  cd "$pkgname-$pkgver"

  make dist DESTDIR="$pkgdir"
}
