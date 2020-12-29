# Maintainer: Srevin Saju <srevinsaju@sugarlabs.org>

pkgname=sugar-git
pkgver=v0.118
pkgrel=1
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
makedepends=('intltool' 'python-empy')
source=("git+https://github.com/sugarlabs/sugar.git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
sha256sums=('SKIP')


build() {
  cd "$srcdir/${pkgname%-git}"
  ./autogen.sh --prefix=/usr --with-python3
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
