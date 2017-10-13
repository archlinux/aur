# Maintainer: Ashymad <czilukim@o2.pl>
pkgname=python2-keepasshttp-git
pkgver=r12.85bdd2c
pkgrel=1
pkgdesc="Access passwords stored in keepass using the http plugin"
arch=('any')
url="https://github.com/jobevers/python-keepasshttp"
source=("$pkgname::git+$url.git")
provides=("${pkgname%-git}")
license=('custom:Unlicense')
depends=('python2' 'python2-cryptography' 'python2-yaml' 'python2-xdg' 'python2-requests')
makedepends=('python2-nose' 'python2-setuptools')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
  cd "$srcdir/$pkgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir" 
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
