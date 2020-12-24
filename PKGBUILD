
# Maintainer: Jack Johannesen <jack AT insertdomain DOT name>

pkgname=ttf-material-design-icons-extended
pkgver=5.8.55
pkgrel=3
pkgdesc="An extended Material Design icons font by the guys over at materialdesignicons.com"
arch=('any')
url="https://materialdesignicons.com/"
license=('custom:PFL')
depends=()
makedepends=()
provides=()
conflicts=('ttf-material-design-icons')
source=("https://cdn.materialdesignicons.com/${pkgver}/fonts/materialdesignicons-webfont.ttf"
        'https://raw.githubusercontent.com/Templarian/MaterialDesign/master/LICENSE')
noextract=('materialdesignicons-webfont.ttf' 'LICENSE')
md5sums=('3e722fd57a6db80ee119f0e2c230ccff'
         'fdfe43d7d0cb0cd53fc1f61411899167')

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

