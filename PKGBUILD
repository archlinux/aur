# Maintainer: Andrey Zhidenkov <pensnarik@gmail.com>

pkgname=pg_export
pkgver=0.4.2
pkgrel=1
pkgdesc="Dumps PostgreSQL database structure on disk"
arch=(any)
depends=(postgresql)
source=("https://github.com/pensnarik/pg_export/archive/v${pkgver}.tar.gz")
md5sums=('1185cc5895b4511b8431694ad6cba334')

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
