# Maintainer: Michal Babik <michal.babik@protonmail.com>

pkgname=wallchanger
pkgver=1.6.18
pkgrel=1
pkgdesc="Automatic wallpaper changer"
arch=('i686' 'x86_64')
url="https://www.nongnu.org/wallchanger/"
license=('GPL3')
depends=('json-c>=0.12.1' 'gtk3>=3.22.0')
depends_x86_64=('libcurl-gnutls')
depends_i686=('libcurl-compat')
makedepends=('autoconf' 'automake' 'libtool' 'pkgconf')
optdepends=('flickcurl: Flickr support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mi-bb/wallchanger/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('ddefd63b9a21057e3a98e6288c52ae7c')
build() {
        cd "$srcdir/$pkgname-$pkgver"
        ./autogen.sh
        ./configure --prefix=/usr
        make
}
package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}

