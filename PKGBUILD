# Maintainer: Marco Pompili <aur@emarcs.org>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Danny Coates <dannycoates@gmail.com>
# Contributor: Danny Coates <dannycoates@gmail.com>
# Contributor: 3y3 <3y3@bk.ru>
# Contributor: Adam Hořčica <horcicaa@gmail.com>
# Contributor: Akzhan Abdulin <akzhan.abdulin@gmail.com>
# Contributor: cattail <zhongchiyu@gmail.com>
# Contributor: Dave <badave@gmail.com>
# Contributor: Dick Hardt <dickhardt@gmail.com>
# Contributor: Gary Katsevman <git@gkatsev.com>
# Contributor: Glenn Block <glenn.block@gmail.com>
# Contributor: Ionuț G. Stan <ionut.g.stan@gmail.com>
# Contributor: Karan Batra-Daitch <karanganesha04@gmail.com>
# Contributor: Kasper Ligaard <kasperligaard@gmail.com>
# Contributor: Mark Constable <markc@renta.net>
# Contributor: Matthew O'Riordan <matthew.oriordan@gmail.com>
# Contributor: Michael Schoonmaker <michael@strongloop.com>
# Contributor: Miroslav Bajtos <miroslav@strongloop.com>
# Contributor: Panagiotis Astithas <pastith@gmail.com>
# Contributor: Peter Flannery <flannery.peter@ntlworld.com>
# Contributor: Philip Tellis <philip.tellis@gmail.com>
# Contributor: Sam Roberts <sam@strongloop.com>
# Contributor: Sergey Krilov <serg.kr@gmail.com>
# Contributor: ssafejava <s@safejava.com>
# Contributor: dannycoates <dannycoates@gmail.com>
# Contributor: piscisaureus <bertbelder@gmail.com>
# Contributor: bajtos <miroslav@strongloop.com>
# Contributor: strongloop <callback@strongloop.com>

_npmname=node-inspector
pkgname=nodejs-$_npmname
pkgver=0.12.8
pkgrel=1
pkgdesc="Web Inspector based nodeJS debugger"
arch=('any')
url="http://github.com/node-inspector/node-inspector"
license=('BSD')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=('bdc6ffb4faee2ba445452bcbeb10e6160493df0f3e4b59b1e49e5313fd8a3310')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
