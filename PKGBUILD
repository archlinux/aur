# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=python-pandas-docs
pkgver=0.18.1
pkgrel=1
pkgdesc="Documentation for Python Pandas module"
makedepends=('unzip')
arch=('any')
url='http://pandas.pydata.org'
license=('BSD')
source=("$pkgname-$pkgver.zip::http://pandas.pydata.org/pandas-docs/stable/pandas.zip")
noextract=("$pkgname-$pkgver.zip")
md5sums=('60290b819c1a247b56eed31a2974dcfd')

package()
{
  install -d "$pkgdir/usr/share/doc/python-pandas"
  unzip -qd "$pkgdir/usr/share/doc/python-pandas" "$srcdir/$pkgname-$pkgver.zip"
  find "$pkgdir/usr/share/doc/python-pandas/html" -type d -exec chmod 755 \{\} \;
  find "$pkgdir/usr/share/doc/python-pandas/html" -type f -exec chmod 644 \{\} \;
}
