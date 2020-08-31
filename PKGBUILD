
# Maintainer: Jack Johannesen <jack AT insertdomain DOT name>

pkgname=ttf-material-design-icons-extended
pkgver=5.4.55
pkgrel=2
pkgdesc="An extended Material Design icons font by the guys over at materialdesignicons.com"
arch=('any')
url="https://materialdesignicons.com/"
license=('custom:SIL')
depends=()
makedepends=()
provides=()
conflicts=('ttf-material-design-icons')
source=('https://cdn.materialdesignicons.com/5.4.55/fonts/materialdesignicons-webfont.ttf' 'https://raw.githubusercontent.com/Templarian/MaterialDesign/master/LICENSE')
noextract=('materialdesignicons-webfont.ttf' 'LICENSE')
md5sums=('8ed8f0719def123d77bf6ea8919b8d8a'
         '1ac896da581480f567e06aa54c92b033')

build() {
  # Rename the ttf file to something more sensible for installation.
  rename \
    $srcdir/materialdesignicons-webfont.ttf \
    $srcdir/material-design-icons-extended.ttf \
    $srcdir/materialdesignicons-webfont.ttf
}

package() {
  # Install the LICENSE.
  install \
    -Dm644 \
    $srcdir/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE";
  # Install the ttf file.
  install \
    -Dm644 \
    $srcdir/material-design-icons-extended.ttf \
    "$pkgdir/usr/share/fonts/TTF/material-design-icons-extended.ttf";
}
