# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=('python-cymruwhois' 'python2-cymruwhois')
_gitname='python-cymruwhois'
pkgver=1.6
pkgrel=2
pkgdesc='Client for the whois.cymru.com service'
arch=('any')
url='https://pythonhosted.org/cymruwhois/'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_gitname::git+https://github.com/JustinAzoff/$_gitname#tag=$pkgver")
sha256sums=('SKIP')

package_python-cymruwhois() {
  depends=('python')
  cd "$srcdir/$_gitname"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-cymruwhois() {
  depends=('python2')
  cd "$srcdir/$_gitname"

  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir/usr/bin/cymruwhois" "$pkgdir/usr/bin/cymruwhois2"
  install -Dm644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

