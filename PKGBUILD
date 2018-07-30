# Contributor: Cihan Alkan <cihanalk@gmail.com>

pkgname=parchives
pkgver=1.18.2
pkgrel=1
pkgdesc="UKUI için pencere Yöneticisi"
url="http://www.ukui.org/"
arch=('x86_64')
license=('GPL')
depends=(gtk3 dconf libarchive file json-glib libnotify zip unzip)
groups=('ukui')
source=("git+https://github.com/liupengluiz/parchives.git")
sha256sums=('SKIP' 'SKIP')

prepare() {
 cd ${pkgname}
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd ${pkgname}
    ./autogen.sh
    ./configure \
    --prefix=/usr --sysconfdir=/etc --localstatedir=/var \

    make
}

package() {
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}
