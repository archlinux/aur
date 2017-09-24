# Maintainer: Zeph <zeph33@gmail.com>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs-cli
pkgver=0.17.1
pkgrel=1
pkgdesc="Command Line (CLI) front-end for RabbitVCS"
arch=('i686' 'x86_64')
url="https://github.com/rabbitvcs/rabbitvcs"
depends=("rabbitvcs>=$pkgver")
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
  _pluginlocation="$pkgdir/usr/bin"

  cd "$srcdir/rabbitvcs-$pkgver/clients/cli"

  sed -i "s#env python#env python2#" rabbitvcs

  mkdir -p "$_pluginlocation"
  cp rabbitvcs "$_pluginlocation"
}
