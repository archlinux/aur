# Maintainer: zlsun <zlsun1995 at gmail dot com>
# Contributor: yetist <yetist@gmail.com>

pkgname=lunar-calendar-git
_pkgname=lunar-calendar
pkgver=3.0.0
pkgrel=1
pkgdesc="Chinese Lunar calendar widget for Gtk+"
arch=("i686" "x86_64")
url="https://github.com/yetist/$_pkgname"
license=('GPL2')
depends=('gtk3>=3.0.9' 'lunar-date>=2.4.0')
makedepends=('git' 'gnome-common' 'gobject-introspection')
conflicts=('lunar-calendar')
provides=('lunar-calendar')
source=("git+https://github.com/yetist/$_pkgname.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname"
    ./autogen.sh
    ./configure --prefix=/usr
    make || return 1
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" install || return 1
}

