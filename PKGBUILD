# Maintainer: Ido Kanner <idokan@gmail.com>
_npmname=tailwindcss
pkgname=tailwind-css
pkgver=1.1.4
pkgrel=1
pkgdesc="A utility-first CSS framework for rapid UI development"
arch=(any)
url="https://tailwindcss.com/"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('36f0c12855ae8378eaa1d610b91e25ecfc798209ecb4d74245dac038ba48b9ba')
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
