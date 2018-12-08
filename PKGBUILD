# Maintainer: Giusy Margarita <kurmikon at libero dot it>

pkgname=korla-icon-theme
pkgver=0.7.7
pkgrel=3
pkgdesc='Korla icon theme suitable for every desktop environment – made by bikass'
arch=('any')
url='https://github.com/bikass/korla'
license=('custom:CC BY-SA 4.0')
depends=('gtk-update-icon-cache')
optdepends=('breeze-icons: fallback Breeze icon theme'
    'gnome-icon-theme: fallback Gnome icon theme'
    'hicolor-icon-theme: fallback Freedesktop.org Hicolor icon theme')

source=("https://github.com/bikass/korla/archive/v$pkgver.tar.gz")
md5sums=('4e239bd25167badcdf0078224edcf0ec')

package() {
    mkdir -p "$pkgdir/usr/share/icons/"

    cp -r "$srcdir/korla-$pkgver/korla" "$pkgdir/usr/share/icons/korla"
    
    chmod 755 $(find "$pkgdir/usr/share/icons/korla" -type d)
    chmod 644 $(find "$pkgdir/usr/share/icons/korla" -type f)
} 

post_install() {
    gtk-update-icon-cache -f -t "/usr/share/icons/korla/"
}
