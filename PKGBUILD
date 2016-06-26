pkgname=nodejs-git-open # All lowercase
pkgver=1.0.2
pkgrel=1
_npmname=git-open
pkgdesc="Open a BitBucket/GitHub/GitLab page or website for a repository in your browser."
arch=(any)
url="https://github.com/paulirish/git-open"
license=()
depends=('nodejs' 'npm')
source=(http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz)
noextract=(${_npmname}-${pkgver}.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
md5sums=('a7e4b1128bff5b92be1fdafa8424eaea')
