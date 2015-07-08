# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
# Contributor: Nick Lanham <nick@nick>

pkgname=pnmixer-gtk2
pkgver=0.5.3
pkgrel=1
pkgdesc="Popular volume mixer systray applet built with gtk2"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/nicklan/pnmixer"
provides=('pnmixer')
conflicts=('pnmixer' 'pnmixer-git')
makedepends=('gettext' 'pkg-config' 'autoconf' 'automake')
depends=('gtk2>=2.22' 'alsa-lib' 'glib2')
source=('https://github.com/nicklan/pnmixer/archive/master.tar.gz')
md5sums=('73a619600472697f6c2830d25fc2061f')

build() {
  cd pnmixer-master
  ./autogen.sh --prefix=/usr --without-gtk3 --without-libnotify
  make
}

package() {
  cd pnmixer-master
  make DESTDIR="$pkgdir" install
}
