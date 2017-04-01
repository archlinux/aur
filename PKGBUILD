# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-pandas-docs
pkgver=0.19.2
pkgrel=1
pkgdesc="Documentation for Python Pandas module."
makedepends=('unzip')
arch=('any')
url='http://pandas.pydata.org'
license=('BSD')
source=("$pkgname-$pkgver.zip::http://pandas.pydata.org/pandas-docs/stable/pandas.zip")
noextract=("$pkgname-$pkgver.zip")
md5sums=('5fcf217e4aa1d5c477d506f8e1d97efc')

package()
{
  install -d "$pkgdir/usr/share/doc/python-pandas"
  unzip -qd "$pkgdir/usr/share/doc/python-pandas" "$srcdir/$pkgname-$pkgver.zip"
  find "$pkgdir/usr/share/doc/python-pandas/html" -type d -exec chmod 755 \{\} \;
  find "$pkgdir/usr/share/doc/python-pandas/html" -type f -exec chmod 644 \{\} \;
}
