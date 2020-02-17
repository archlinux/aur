# Maintainer: Zeph <zeph33@gmail.com>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs-cli
pkgver=0.18.0
pkgrel=1
_gitcommit='e44328e01ed82dd8a8dbfec952f5982e355b8416'

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
sha256sums=('a9f59d0eff65526887f719eb72712eac7d7aaa84cf9993c7b69b7b17b0b13143')
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
