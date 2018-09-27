# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_gitname="jalv_select"
pkgname="jalv-select"
pkgver=1.1
pkgrel=1
pkgdesc="A little GUI to select installed LV2 plug-ins and run them with jalv."
arch=('i686' 'x86_64')
url="https://github.com/brummer10/jalv_select"
license=('custom:Public Domain')
depends=('jalv' 'gtkmm')
source=("https://github.com/brummer10/${_gitname}/archive/v${pkgver}.tar.gz")
md5sums=('c4cd68ed92974bf112995c373413ffc5')

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
