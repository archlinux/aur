# Maintainer: Eric Spreen <erispre@gmail.com>
pkgname=gnunet-gtk-git
pkgdesc="A framework for secure peer-to-peer networking (GTK 3 interfaces)"
pkgver=0.10.1_git_087f8e16
pkgrel=1
arch=('i686' 'x86_64')
url="http://gnunet.org"
license=('GPL3')
conflicts=('gnunet-gtk')
provides=('gnunet-gtk')
depends=('gnunet-git' 'gtk3' 'libglade')
source=('git+https://gnunet.org/git/gnunet-gtk.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/gnunet-gtk"
    echo "0.10.1_git_$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/gnunet-gtk"
    ./bootstrap
    ./configure --prefix=/usr --with-gnunet=/usr
    make
}

package() {
    cd "${srcdir}/gnunet-gtk"
    make DESTDIR="${pkgdir}/" install
}
