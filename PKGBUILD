# Maintainer: Murat Çileli <murat.cileli@gmail.com>

pkgname="adwaita-creamy"
pkgver="3.24.8"
pkgrel="1"
pkgdesc="Refreshed new Adwaita theme with creamy colors and minor changes."
arch=("x86_64")
license=("MIT")
url="https://github.com/murat-cileli/adwaita-creamy"
makedepends=()
provides=("adwaita-creamy")
source=("$pkgname-$pkgver::https://github.com/murat-cileli/adwaita-creamy/archive/$pkgver.tar.gz")
sha256sums=("SKIP")
user_name="$(logname)"
   
package() {
    # Remove old version from user's home themes
    rm -rf $pkgdir/home/${user_name}/.themes/$pkgname 
    
    # Create directory
    mkdir -p $pkgdir/usr/share/themes/$pkgname

    # Copy contents
    cp -r "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/share/themes/$pkgname"
}
