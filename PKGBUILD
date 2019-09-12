# Maintainer: Zeph <zeph33@gmail.com>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs-cli
pkgver=0.17.2
pkgrel=1
_gitcommit='e7d5a82836855675b11cc860bc9cc3ce56864ffd'
pkgdesc="Command Line (CLI) front-end for RabbitVCS"
arch=('i686' 'x86_64')
url="https://github.com/rabbitvcs/rabbitvcs"
depends=("rabbitvcs>=$pkgver")
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
  _pluginlocation="$pkgdir/usr/bin"

  cd "$srcdir/rabbitvcs-$pkgver/clients/cli"

  mkdir -p "$_pluginlocation"
  cp rabbitvcs "$_pluginlocation"
}
