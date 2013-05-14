# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.8.2
pkgrel=1
pkgdesc="A VNC Client for the GNOME Desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
depends=('libsecret' 'gtk-vnc' 'vte3' 'telepathy-glib' 'avahi' 'desktop-file-utils' 'dconf' 'shared-mime-info' 'gnome-icon-theme')
optdepends=('openssh: SSH plugin'
            'rdesktop: RDP plugin')
makedepends=('docbook-xsl' 'intltool' 'rdesktop' 'openssh' 'itstool')
groups=('gnome-extra')
options=('!emptydirs' '!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('eda05e6abfd3d575f8b954c1e442d28639ae13b67fc285ef585b8cd78da014e8')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vinagre --enable-rdp --disable-spice
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
