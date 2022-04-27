# Maintainer: prg <prg-archlinux@xannode.com>
# Contributor: prg <prg-archlinux@xannode.com>
pkgname=griver
pkgver=0.2.5
pkgrel=1
pkgdesc="Small database generator for iriver H100/H300 devices based on libiriverdb."
arch=('any')
url="https://github.com/prg318/griver"
license=('GPL')
depends=('python2' 'libiriverdb' 'pygtk')
source=("https://github.com/prg318/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('988031f0a6bbba529ffd1ef1628aac6fe1a9e47251731591e92222671511bcee')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=0
  install -m 755 griver.py $pkgdir/usr/bin/ # fix the ./setup.py hashbang override
  mv $pkgdir/usr/bin/griver.py $pkgdir/usr/bin/griver
}

# vim:set ts=2 sw=2 et:
