# Maintainer: Atakku <atakkudev@gmail.com>
_npmname=tailwindcss
pkgname=tailwind-css
pkgver=2.0.2
pkgrel=2
pkgdesc="A utility-first CSS framework for rapid UI development"
arch=(any)
url="https://tailwindcss.com/"
license=(MIT)
depends=('nodejs' 'nodejs-autoprefixer' 'nodejs-postcss')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('f1815cf39258793c0694bb34d62c9e9f33fd4c77865de737946e3b348f27f4e9')
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
