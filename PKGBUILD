# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Micha Alt <micha.tucker at gmail dot com>

_npmname=gulp
pkgname=nodejs-$_npmname
pkgver=3.9.0
pkgrel=3
pkgdesc="The streaming build system"
provides=('gulp')
conflicts=('gulp')
arch=('any')
url="http://gulpjs.com/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
md5sums=('5b35a2a4187c45f6ea4e74a5f47de0f9')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$_npmname"
  ln -s "../../../lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$_npmname/"
}

