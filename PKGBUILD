# Maintainer: jzapiola <jzapiola@proton.me>
pkgname=pluma-plugins
pkgver=1.28.0
pkgrel=1
pkgdesc="A set of plugins for Pluma"
arch=('any')
url="https://github.com/mate-desktop/$pkgname"
license=('GPL2')
depends=('pluma>=1.28.0')
makedepends=('autoconf-archive' 'gtksourceview4' 'gobject-introspection' 'make' 'mate-common' 'yelp-tools')
optdepends=('atril: to use the synctex plugin with atril'
            'dbus-python: to use the synctex plugin with atril'
            'ctags: to use the sourcecode browser'
            'vte3: to use the embedded terminal'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mate-desktop/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0e509825378f2f03f7b7342da2585a4d3eeafb4347673690cca295716e41053861e6050111320d04b17ddd902f947902ebc4c2eef9281093b2dce360cf3ac26d')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}

