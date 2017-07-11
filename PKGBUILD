# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=buku
pkgver=3.1
pkgrel=1
pkgdesc="cmdline bookmark management utility written in Python3 and SQLite3"
arch=('any')
depends=('python' 'python-beautifulsoup4' 'python-cryptography' 'python-requests' 'python-urllib3')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/v$pkgver)
sha256sums=('7bc3f162d6bfc2e89b9f41fab93fba596729598bea7bbf86eac52377a024041c')

package() {
  cd "$srcdir/Buku-$pkgver"
  install -Dm 644 $pkgname.1 "${pkgdir}/usr/share/man/man1/$pkgname.1"
  python setup.py install --root=${pkgdir} --prefix=/usr
}
