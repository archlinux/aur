# Maintainer: iBug <ibug@ibug.io>
pkgname=zfs-recompress.py
pkgver=r6.c77584d
pkgrel=1
pkgdesc="Python rewrite of zfs-recompress for better performance"
arch=('any')
url="https://github.com/iBug/zfs-recompress.py"
license=('MIT')
depends=('python')
makedepends=('git')
provides=('zfs-recompress.py')
conflicts=('zfs-recompress.py')
source=("git+https://github.com/iBug/zfs-recompress.py.git#branch=master")
md5sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 zfs-recompress.py "$pkgdir/usr/bin/zfs-recompress.py"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
