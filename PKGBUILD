# Contributor: Ryan Corder <mrc@bofh.io>

pkgname="gnome-shell-extension-torstatus-git"
pkgver=0.0.5
pkgrel=1
pkgdesc="GNOME shell aggregate system menu Tor indicator"
arch=('i686' 'x86_64')
url="https://github.com/subgraph/gnome-shell-extension-torstatus"
license=('GPL')
source=('git://github.com/subgraph/gnome-shell-extension-torstatus.git')
sha1sums=('SKIP')
depends=('gnome-common')
optdepends=('onioncircuits: display Tor circuits and streams')

build() {
  cd "$srcdir/gnome-shell-extension-torstatus"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/gnome-shell-extension-torstatus"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "$srcdir/gnome-shell-extension-torstatus"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
