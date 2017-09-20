# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs-nautilus
pkgver=0.17.1
pkgrel=1
pkgdesc="Nautilus front-end for RabbitVCS"
arch=('any')
url="https://github.com/rabbitvcs/rabbitvcs"
install=$pkgname.install
depends=('nautilus>=3.0.0' 'python2-nautilus' 'python2-dbus' "rabbitvcs>=$pkgver")
license=('GPL')
_gitcommit=""
if [ "${_gitcommit}" != "" ]; then
  source=("rabbitvcs-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
else
  source=("rabbitvcs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
fi
md5sums=('95b7c30945f10333588a39b5f6766136')
#md5sums=('SKIP')

package(){
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/rabbitvcs-$_gitcommit" "$srcdir/rabbitvcs-$pkgver"
  fi
	install -D "$srcdir/rabbitvcs-$pkgver/clients/nautilus-3.0/RabbitVCS.py" "$pkgdir/usr/share/nautilus-python/extensions/RabbitVCS.py"
}
