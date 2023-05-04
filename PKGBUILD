# Maintainer: Elliott Seymour <rensenware at protonmail dot com>
# Contributer: Jack Johannesen

pkgname=ttf-material-design-icons-extended
pkgver=7.2.96
pkgrel=1
pkgdesc="A Material Design icons font by the guys over at materialdesignicons.com"
arch=('any')
url="https://materialdesignicons.com/"
license=('custom:PFL')
depends=()
makedepends=()
provides=()
conflicts=('ttf-material-design-icons')
source=("https://cdn.jsdelivr.net/npm/@mdi/font@${pkgver}/fonts/materialdesignicons-webfont.ttf"
        'https://raw.githubusercontent.com/Templarian/MaterialDesign/master/LICENSE')
noextract=('materialdesignicons-webfont.ttf' 'LICENSE')
md5sums=('d10ac4ee5ebe8c8fff90505150ba2a76'
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

