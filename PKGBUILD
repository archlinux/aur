# Maintainer: Prasad Kumar
pkgname=gnome-shell-theme-telinkrin
pkgver=2.1
pkgrel=5
pkgdesc="GNOME Shell theme for Telinkrin GTK Theme"
arch=('any')
url="https://www.opendesktop.org/p/1215199/"
license=('CC BY-NC-SA')
depends=('gnome-shell>=3.26')
provides=('gnome-shell-theme-telinkrin')

# A temporary hack job to resolve OpenDesktop's dynamic URLs for Arrongin/Telinkrin related AUR packages
_dynamicURL="https://raw.githubusercontent.com/prasadkumar013/AUR/master/resolveURL/$pkgname"

_resolve_URL() {
        echo "$(curl -q $_dynamicURL)"
}

source=("${pkgname}-${pkgver}.tar.xz::"$(_resolve_URL _dynamicURL)"/Telinkrin-shell-$pkgver.tar.xz")
sha512sums=('8edf01058de7172be1c1a48e8c95ec1c90816508e8fd0b3cfe0ea9043a07264391d26d3a800f4097fa40ab626753ca22940eb4b469dc9b5d4529c247324f0b17')
package() {
  cd "${srcdir}"/Telinkrin-shell-${pkgver}
  install -d "$pkgdir"/usr/share/themes/Telinkrin
  cp -rf * "$pkgdir"/usr/share/themes/Telinkrin
}
