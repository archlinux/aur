# Maintainer: Prasad Kumar
pkgname=arrongin-icon-theme
pkgver=2.1
pkgrel=5
pkgdesc="A matching icon theme for Arrongin-GTK theme based on Adwaita and MySuru"
arch=('any')
url='https://www.opendesktop.org/p/1215199/'
license=('CC BY-NC-SA')
depends=('hicolor-icon-theme')
provides=('arrongin-icon-theme')

# A temporary hack job to resolve OpenDesktop's dynamic URLs for Arrongin/Telinkrin related AUR packages
_dynamicURL="https://raw.githubusercontent.com/prasadkumar013/AUR/master/resolveURL/$pkgname"

_resolve_URL() {
        echo "$(curl -q $_dynamicURL)"
}

source=("${pkgname}-${pkgver}.tar.xz::"$(_resolve_URL _dynamicURL)"/Arrongin-Suru-$pkgver.tar.xz")
sha512sums=('ced07baa78690f370009fb04e83f4e229e5e841de02f163fb72b277e1b3ea4dce7397cde1262649fbd683d2ba54b6807968fe83319f777d1292bb1c9328f4950')
package() {
  cd "${srcdir}"/Arrongin-Suru-$pkgver
  install -d "$pkgdir"/usr/share/icons/Arrongin
  cp -rf * "$pkgdir"/usr/share/icons/Arrongin
}
