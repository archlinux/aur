# Maintainer: Atakku <atakkudev@gmail.com>
_npmname=tailwindcss
pkgname=tailwind-css
pkgver=2.0.3
pkgrel=1
pkgdesc="A utility-first CSS framework for rapid UI development"
arch=(any)
url="https://tailwindcss.com/"
license=(MIT)
depends=('nodejs' 'nodejs-autoprefixer' 'nodejs-postcss')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('41aff02717bdad5b098e5916329ba69d87e39bc500556ee6330e7173ba02cc17')
optdepends=()
options=(!strip)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  install "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
