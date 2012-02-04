# Maintainer: Thomas Jost <schnouki+aur@schnouki.net>
pkgname=git-extras
pkgver=0.9.0
_pkgtag=948308b
pkgrel=1
pkgdesc="GIT utilities -- repo summary, commit counting, repl, changelog population and more"
arch=(any)
url="http://github.com/visionmedia/git-extras"
license=('unknown')
depends=('git' 'bash')
makedepends=('ronn')
source=(git-extras-$pkgver.tar.gz::https://github.com/visionmedia/${pkgname}/tarball/${pkgver})
md5sums=('b27235c1a3eaa18ba2f91e4a56a6c527')
sha256sums=('926ec2c50930e01f461a11eac13a16fd9fb91b852b67d7766810a5c5a986e00e')

build() {
  cd "$srcdir/visionmedia-$pkgname-$_pkgtag"
  sed -i 's! /etc! $(PREFIX)/etc!g' Makefile

  make docs

}

package() {
  cd "$srcdir/visionmedia-$pkgname-$_pkgtag"

  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
