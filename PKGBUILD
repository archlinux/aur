# Maintainer: Mike Sampson <mike at sambodata dot com>
pkgname=polysh
pkgver=0.4
pkgrel=1
pkgdesc="a tool to aggregate several remote shells into one."
arch=('any')
url="http://guichaz.free.fr/polysh/"
license=('GPL2')
depends=('python2')
options=(!emptydirs)
source=("http://guichaz.free.fr/polysh/files/polysh-0.4.tar.bz2")
md5sums=('1d267caad5398b841c36d8c68b883a29')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's|env python|env python2|' polysh.py
  sed -i -e 's|env python|env python2|' polysh/rb_tree.py
  python2 setup.py install --root="$pkgdir/" --optimize=1
  chmod 644 "$pkgdir/usr/share/man/man1/polysh.1"
}

# vim:set ts=2 sw=2 et:
