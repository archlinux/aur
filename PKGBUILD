# Maintainer: Srevin Saju <srevinsaju@sugarlabs.org>

pkgname=sugar-git
pkgver=v0.118.1.g63885ed7
pkgrel=1
pkgdesc="Sugar GTK shell"
arch=('any')
url="https://sugarlabs.org/"
license=('GPL')
depends=('gnome-keyring' 'gst-plugins-espeak' 'gtksourceview3' 'gvfs' 'libwnck3'
         'libxklavier' 'metacity' 'mobile-broadband-provider-info' 'openssh' 'python-gwebsockets-git'
         'sugar-toolkit-gtk3-git' 'telepathy-gabble' 'telepathy-salut' 'upower' 'webkit2gtk'
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
