# Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>

_npmname=git-open
pkgname=nodejs-$_npmname
pkgver=2.0.0
pkgrel=1
pkgdesc="Open a BitBucket/GitHub/GitLab page or website for a repository in your browser."
arch=(any)
url="https://github.com/paulirish/git-open"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz)
noextract=(${_npmname}-${pkgver}.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --user root --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" $_npmname@$pkgver

  ## Remove empty dir
  rmdir "$pkgdir/usr/etc/"
}

sha256sums=('4056524ae3b6443c0064a7e9b6e7c44fd9b488352fcc72e368d4ee4b01d80331')
