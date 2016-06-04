# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=nyaovim
pkgver=0.0.19
pkgrel=2
pkgdesc="Neovim frontend built on Electron"
arch=(any)
url="https://www.npmjs.com/package/nyaovim"
license=("MIT")
depends=('nodejs' 'libnotify')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
"$pkgname.desktop")
sha256sums=('cd29cee59ef904da12bb3789b391cc28fac22a7936f205d07ecdea6ee53324e0'
            '5dd8dc38f332ee035743f61cae390b50a5c5b94c6a7a448cd4afe28042d0712c')
noextract=("$pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  rm -r "$pkgdir/usr/etc"
  install -Dm644 $srcdir/$pkgname.desktop "$pkgdir/usr/share/applications/nyaovim.desktop"
}
