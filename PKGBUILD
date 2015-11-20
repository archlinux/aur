# Contributor: Cyker Way <cykerway at gmail dot com>
# Maintainer:  Cyker Way <cykerway at gmail dot com>

pkgname=ncmpy
pkgver=1.4
pkgrel=1
pkgdesc="A curses-based MPD client written in Python."
arch=('i686' 'x86_64')
url="http://www.cykerway.com/projects/ncmpy"
license=('GPL3')
depends=('python2' 'python2-mpd')
conflicts=('ncmpy-git')
source=("https://github.com/cykerway/ncmpy/archive/v$pkgver.tar.gz")
sha256sums=('ec85151b3f19e9b4481836a1d4caf1f0d5b82a57f12b65c3a733cfce80e468cc')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 \
    "$srcdir/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/ncmpy/LICENSE"

  install -Dm644 \
    "$srcdir/$pkgname-$pkgver/INSTALL" \
    "$pkgdir/usr/share/ncmpy/INSTALL"

  install -Dm644 \
    "$srcdir/$pkgname-$pkgver/README.md" \
    "$pkgdir/usr/share/ncmpy/README.md"

  install -Dm644 \
    "$srcdir/$pkgname-$pkgver/share/ncmpy.conf.example" \
    "$pkgdir/usr/share/ncmpy/ncmpy.conf.example"
}

# vim:set ts=2 sw=2 et:
