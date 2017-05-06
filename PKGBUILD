# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=polychromatic
pkgver=0.3.9
pkgrel=1
pkgdesc='A graphical front end for managing Razer peripherals under GNU/Linux.'
arch=('any')
license=('GPL2')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/lah7/polychromatic/archive/v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/z3ntu/polychromatic/3f00590503592564bf9f973f0add0cbe2ce2cd51/Makefile")
url='https://github.com/lah7/polychromatic'
makedepends=('rsync')
depends=('python' 'hicolor-icon-theme' 'python-razer' 'webkit2gtk' 'libappindicator-gtk3' 'imagemagick')
sha512sums=('213a7f5e4ae419c8199d2bd3058ada133393b2af5c4b91d4341ee490d3859b004a29e8d56a5b4a83b0d7688afaa456a92a69c1e8ccd6660a7a0ff36a28f65766'
            '7b70c2c6f51b628cb63920358bffe5ac2afc3918124c418677c065a4b72fddf9cd709acbb87ae2df8c69ddfe46513390f9cfffc81db89b5d8026cdbf3a86caf4')

prepare() {
  cp $srcdir/Makefile $srcdir/$pkgname-$pkgver
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
