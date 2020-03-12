# Maintainer: Srevin Saju <srevin03@gmail.com>

pkgname=sugar-git
pkgver=0.116.g
pkgrel=5
pkgdesc="Sugar GTK shell"
arch=('any')
url="https://sugarlabs.org/"
license=('GPL')
depends=('gst-plugins-espeak' 'gtksourceview3' 'gvfs' 'libwnck3'
         'libxklavier' 'metacity' 'mobile-broadband-provider-info' 'openssh' 'telepathy-mission-control'
	 'python-cairo' 'python-xapian' 'python-gobject' 'python-dbus' 'gtk2' 
	 'python-dateutil' 'icon-naming-utils' 'python-decorator' 
         'telepathy-gabble' 'telepathy-salut' 'upower' 'webkit2gtk'
         'xdg-user-dirs')
makedepends=('intltool')
source=("git+https://github.com/sugarlabs/sugar.git")
sha256sums=('SKIP')


build() {
  cd $pkgname-$pkgver
  ./autogen.sh --prefix=/usr --with-python3
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
