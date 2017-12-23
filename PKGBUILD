# Maintainer: Jakob Tsar-Fox <jakob@memeware.net>
pkgname=chandere2
pkgver=2.5.0
pkgrel=2
pkgdesc="An extremely modular asynchronous archiving tool for various imageboards, textboards, and Boorus. "
arch=('any')
url="https://github.com/TsarFox/chandere"
license=('GPL3')
depends=('python' 'python-aiohttp')
makedepends=('python-setuptools' 'pandoc')
source=("https://github.com/TsarFox/chandere/archive/2.5.0a1.tar.gz")
md5sums=('94cf023035f14e52e6617bdcdffdc694')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1

  make doc

  install -d $pkgdir/usr/share/man/man1/
  install -m 644 $srcdir/$pkgname-$pkgver/docs/*.1.gz $pkgdir/usr/share/man/man1/
}
