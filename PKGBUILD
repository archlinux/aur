# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>
pkgname=greitukas
pkgver=1.3
pkgrel=1
pkgdesc="A daemon that runs as tcp server and allows to change max, min, current frequency and select governor of each or all cpus."
arch=('any')
url="http://sourceforge.net/projects/greitukas"
license=('GPL')
makedepends=(p7zip)
source=(http://downloads.sourceforge.net/greitukas/$pkgver/$pkgname-$pkgver-src.tar.7z)
md5sums=(76580928ab934ecb8aec06c89840a102)

build() {
  cd "$srcdir"
  tar -xf "$pkgname-$pkgver-src.tar"
  cd "$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" install
}
