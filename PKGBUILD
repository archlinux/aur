#Maintainer: Dan Denkijin < dandenkijin at gmail dot com >
_npmname=zoho-extension-toolkit
_npmver=1.0.21
pkgname=zoho-extension-toolkit
pkgver=1.0.21
pkgrel=1
pkgdesc="CLI tool for developing Zoho Extension widgets."
arch=(any)
url="https://www.zoho.com/developer/help/extensions/zappscli.html"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
sha1sums=(66a2cd6eadfdc9f103b94ce903924f6576aba0a0)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
