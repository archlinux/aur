# Maintainer: Anthony Vitacco <anthony@littlegno.me>
# Contributor: Jente Hidskes <hjdskes@gmail.com> 

pkgname=gcolor3-git
_gitname=gcolor3
pkgver=2016.08.20
pkgrel=1
pkgdesc="A simple color selection dialog in GTK3. Git version."
arch=('i686' 'x86_64')
url="http://hjdskes.github.io/projects/gcolor3/"
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'gnome-common')
conflicts=('gcolor3')
source=('git://github.com/Hjdskes/gcolor3.git')
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
    cd $_gitname/
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd $_gitname/
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

