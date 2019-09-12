# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs-nautilus
pkgver=0.17.2
pkgrel=1
_gitcommit='e7d5a82836855675b11cc860bc9cc3ce56864ffd'

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
sha256sums=('658f410d29baf615f668ff0d787e5f3769c887d3077a307b6da9d2169291fa5f')
#sha256sums=('SKIP')

package(){
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/rabbitvcs-$_gitcommit" "$srcdir/rabbitvcs-$pkgver"
  fi
	install -D "$srcdir/rabbitvcs-$pkgver/clients/nautilus/RabbitVCS.py" "$pkgdir/usr/share/nautilus-python/extensions/RabbitVCS.py"
}
