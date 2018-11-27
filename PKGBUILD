# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Markus Schaaf <markuschaaf@gmail.com>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
pkgname=python-xmp-toolkit
pkgver=2.0.1
pkgrel=3
pkgdesc='A library for working with XMP metadata'
arch=(any)
url='http://python-xmp-toolkit.readthedocs.org/'
license=(custom)
depends=('python>=3.5'
         'exempi>=2.2.0'
         'python-pytz')
makedepends=('python-setuptools')
source=('https://files.pythonhosted.org/packages/5b/0b/4f95bc448e4e30eb0e831df0972c9a4b3efa8f9f76879558e9123215a7b7/python-xmp-toolkit-2.0.1.tar.gz')
sha256sums=('f8d912946ff9fd46ed5c7c355aa5d4ea193328b3f200909ef32d9a28a1419a38')
 
build() {
        cd "$srcdir/python-xmp-toolkit-${pkgver}"
        /usr/bin/python setup.py build
}
 
package() {
        cd "$srcdir/python-xmp-toolkit-${pkgver}"
        install -d "$pkgdir/usr/share/licenses/$pkgname"
        install -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
        /usr/bin/python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
