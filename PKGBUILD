# Maintainer: gbr <gbr@protonmail.com>
pkgname=gnethogs
pkgver=0.2+6+gbb69c6f
pkgrel=2
pkgdesc='GTK front-end for nethogs'
arch=('any')
url='https://github.com/mbfoss/gnethogs'
_commit=
license=('GPL')
depends=('gtkmm3' 'nethogs')
makedepends=('git' 'intltool' 'libxml2')
_commit=bb69c6f82e059a451174c24a6bb1a21b32173f6c
source=("git+https://github.com/mbfoss/gnethogs.git#commit=$_commit")
sha512sums=('SKIP')
install=gnethogs.install

pkgver() {
    cd "$pkgname"
    git describe --tags | sed 's/^v//g; s/-/+/g'
}

build() {
    cd "$pkgname"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
