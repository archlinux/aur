# Maintainer: Giusy Margarita <kurmikon at libero dot it>

pkgname=korla-icon-theme
pkgver=0.8.0
pkgrel=1
pkgdesc='Korla icon theme suitable for every desktop environment – made by bikass'
arch=('any')
url='https://github.com/bikass/korla'
license=('GPL3')
depends=('gtk-update-icon-cache')
optdepends=('hicolor-icon-theme: fallback Freedesktop.org Hicolor icon theme'
    'breeze-icons: fallback Breeze icon theme'
    'gnome-icon-theme: fallback Gnome icon theme')
source=("https://github.com/bikass/korla/archive/v$pkgver.tar.gz")
md5sums=('4959e758356b796cc262172312f50fca')

package() {
    mkdir -p "$pkgdir/usr/share/icons/"

    cp -drf --no-preserve=mode,ownership "$srcdir/korla-$pkgver/korla" "$pkgdir/usr/share/icons/korla"
} 

post_install() {
    gtk-update-icon-cache -f -t "/usr/share/icons/korla/"
}
