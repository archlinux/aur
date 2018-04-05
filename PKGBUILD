# Maintainer: Prasad Kumar
pkgname=arrongin-gtk-theme
pkgver=2.3
pkgrel=4
pkgdesc="An individual and unique looking theme with an interesting design of Nautilus sidebar"
arch=('any')
url='https://www.opendesktop.org/p/1215199/'
license=('CC BY-NC-SA')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3>=3.20')
provides=('arrongin-gtk-theme')

# A temporary hack job to resolve OpenDesktop's dynamic URLs for Arrongin/Telinkrin related AUR packages
_dynamicURL="https://raw.githubusercontent.com/prasadkumar013/AUR/master/resolveURL/arrongin_telinkrin"

_resolve_URL() {
        echo "$(curl -q $_dynamicURL)"
}

source=("${pkgname}-${pkgver}.tar.xz::"$(_resolve_URL _dynamicURL)"/Arrongin-$pkgver.tar.xz")
sha512sums=('7fe601d9f4b82f293f0bf8c19c259b5a7c3ccda3cc001e2fe50f4ab87d133a077cd41b354f106ed74196fa4086702e8cb8b6ef54f668b3262fb94bb721a8ae22')
package() {
  cd "${srcdir}"/Arrongin-$pkgver
  install -d "$pkgdir"/usr/share/themes/Arrongin
  cp -rf * "$pkgdir"/usr/share/themes/Arrongin
}
