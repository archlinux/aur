# Maintainer: James Pulec
_npmname=cspell
_npmver=8.18.0
pkgname=nodejs-cspell # All lowercase
pkgver=8.18.0
pkgrel=1
pkgdesc="A Spelling Checker for Code!"
arch=(any)
url="https://streetsidesoftware.github.io/cspell/"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(6e3f58bdf8ac4be027f076b5b7013e267179c895)

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
