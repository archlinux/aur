# Maintainer: Nanda Okitavera <codeharuka.yusa@gmail.com>
pkgname=clearine-git
pkgver=0.7
pkgrel=3
pkgdesc="Beautiful Logout UI for X11 window manager"
arch=('any')
url="https://github.com/okitavera/clearine"
license=('MIT')
depends=('python-gobject' 'python-cairo')
makedepends=('git')
backup=('etc/clearine.conf')
source=("clearine-git::git+https://github.com/okitavera/clearine.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --abbrev=0
}

package() {
  cd $pkgname
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -d -m755 $pkgdir/etc/
  install -S -m644 $pkgdir/usr/share/clearine/clearine.conf $pkgdir/etc/
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/clearine/LICENSE.md"
}
