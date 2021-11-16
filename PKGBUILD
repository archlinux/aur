# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>
pkgname=greitukas
pkgver=1.5
pkgrel=1
pkgdesc="A daemon that runs as a tcp server and allows to change max, min, current frequency and select governor for each or all cpus."
arch=('any')
url="http://sourceforge.net/projects/greitukas"
license=('GPL')
source=(http://downloads.sourceforge.net/greitukas/$pkgver/$pkgname-$pkgver-src.tar.7z)
md5sums=(6e5e4f1c93b8f9d8ab5d32d0937c2c08)

build() {
  7z x "$pkgname-$pkgver-src.tar.7z"
  tar -xf "$pkgname-$pkgver-src.tar"
  cd "$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-systemd
}
