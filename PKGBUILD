# Maintainer: Zeph <zeph33@gmail.com>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs-cli
pkgver=0.17.3
pkgrel=1
_gitcommit='5555d67769c0af1d143a78c56ea91425caf23178'

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
sha256sums=('d5d3e038bd9d007c8ebe7289598cf66fa0f79c12dbf46e9ebd64dc1ebb8367fe')
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
