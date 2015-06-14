# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=lwxc-git
_pkgname=lwxc
pkgver=c656d4d
pkgrel=1
pkgdesc="le wild xmms2 client, a simple media library browser"
arch=('any')
url="http://phragment.github.com/lwxc/"
license=('GPL3')
depends=('python' 'python-gobject' 'python-dbus' 'xmms2-git')
makedepends=('git')
provides=('lwxc')
conflicts=('lwxc')
install=lwxc.install
source=('lwxc::git+https://github.com/phragment/lwxc.git'
        'lwxc.desktop')
md5sums=('SKIP'
         '9d7b791ebfa705392f963373789c0671')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  # nothing to do here
}

package() {
  cd "$srcdir/$_pkgname"

  install -D -m755 lwxc.py "$pkgdir/usr/bin/lwxc"
  install -D -m644 lwxc.svg "$pkgdir/usr/share/pixmaps/lwxc.svg"

  install -D -m644 "$srcdir/lwxc.desktop" "$pkgdir/usr/share/applications/lwxc.desktop"
}

# vim:set ts=2 sw=2 et:
