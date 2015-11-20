# Contributor: Cyker Way <cykerway at gmail dot com>
# Maintainer:  Cyker Way <cykerway at gmail dot com>

pkgname=ncmpy
pkgver=1.2
pkgrel=1
pkgdesc="A curses-based MPD client written in Python."
arch=('i686' 'x86_64')
url="http://www.cykerway.com/projects/ncmpy"
license=('GPL3')
depends=('python2' 'python2-mpd')
conflicts=('ncmpy-git')
source=("https://github.com/cykerway/ncmpy/archive/v$pkgver.tar.gz")
sha256sums=('33db27db4c7b164422bad106b50871c616a8e15412da5bee212346a89803d609')

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
