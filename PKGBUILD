# Maintainer: Jakob Tsar-Fox <jakob@memeware.net>
pkgname=chandere2
pkgver=2.3.1.post1
pkgrel=2
pkgdesc="An asynchronous image/file downloader and thread archiver for imageboards."
arch=('any')
url="https://github.com/TsarFox/chandere2"
license=('GPL3')
depends=('python' 'python-aiohttp')
makedepends=('python-setuptools')
source=("https://github.com/TsarFox/chandere2/archive/v2.3.1.post1.tar.gz")
md5sums=('7846d3e4387128a8be782299384f0849')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1

  install -d $pkgdir/usr/share/man/man1/
  install -m 644 $srcdir/$pkgname-$pkgver/docs/*.1 $pkgdir/usr/share/man/man1/
}
