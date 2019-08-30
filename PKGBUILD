# Maintainer: Kevin Kuehler <keur@ocf.berkeley.edu>

_pkgname='fluffy'
pkgname="$_pkgname-cli"
pkgver='v1.28.0'
pkgrel=1
pkgdesc="fluffy: a file sharing web app that doesn't suck."
install="$pkgname.install"
arch=('x86_64')
url="https://github.com/chriskuehl/$_pkgname"
license=('MIT' 'custom')
depends=('python' 'python-requests')
makedepends=('python')
provides=('fput' 'fpb')
conflicts=('fput' 'fpb')
source=("$_pkgname::git+$url#tag=$pkgver" 'config')
sha256sums=('SKIP' 'd07312009d79dd92164fa0f37597f2721abcc01089628d85f20fe9fb2ac05f3d')

package() {
  install="$pkgname.install"
  cd "$srcdir/$_pkgname/cli"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../../config "$pkgdir/etc/fluffy.json"
}
