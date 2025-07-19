# Maintainer: James Pulec
_npmname=cspell
_npmver=9.2.0
pkgname=nodejs-cspell # All lowercase
pkgver=9.2.0
pkgrel=1
pkgdesc="A Spelling Checker for Code!"
arch=(any)
url="https://streetsidesoftware.github.io/cspell/"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(a3197a7583f632c0d16ef3c24da5c0009a43ef49)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver

  # Install license
  install -Dm 644 "${pkgdir}/usr/lib/node_modules/cspell/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
