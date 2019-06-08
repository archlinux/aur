# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_gitname="jalv_select"
pkgname="jalv-select"
pkgver=1.3
pkgrel=1
pkgdesc="A little GUI to select installed LV2 plug-ins and run them with jalv."
arch=('i686' 'x86_64')
url="https://github.com/brummer10/jalv_select"
license=('custom:Public Domain')
depends=('jalv' 'gtkmm')
source=("https://github.com/brummer10/${_gitname}/archive/v${pkgver}.tar.gz")
md5sums=('9424e782e1cd6e0c5243f41f7af10d66')

build() {
  cd "${srcdir}/${_gitname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${_gitname}-${pkgver}"

  make install DESTDIR="$pkgdir"

  # readme
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  # license
  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
