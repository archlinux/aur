# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: gilcu3

pkgname=rabbitvcs-nautilus
pkgver=0.19
pkgrel=1
_gitcommit=''

pkgdesc="Nautilus front-end for RabbitVCS"
arch=('any')
url="https://github.com/rabbitvcs/rabbitvcs"
install=$pkgname.install
depends=('nautilus>=3.0.0' 'python-nautilus' 'python-dbus' "rabbitvcs>=$pkgver")
license=('GPL')

if [ "${_gitcommit}" != "" ]; then
  source=("rabbitvcs-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
else
  source=("rabbitvcs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
fi
sha256sums=('83deaafb1e95f4eae9cf083ba2296507c909540cbcb5a0616ee0dd9dbf903e74')

package(){
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/rabbitvcs-$_gitcommit" "$srcdir/rabbitvcs-$pkgver"
  fi
	install -D "$srcdir/rabbitvcs-$pkgver/clients/nautilus/RabbitVCS.py" "$pkgdir/usr/share/nautilus-python/extensions/RabbitVCS.py"
}
