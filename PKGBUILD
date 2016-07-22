# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=nyaovim
pkgver=0.0.19
pkgrel=3
pkgdesc="Neovim frontend built on Electron"
arch=(any)
url="https://www.npmjs.com/package/nyaovim"
license=("MIT")
depends=('nodejs' 'libnotify')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
"$pkgname.desktop")
sha256sums=('cd29cee59ef904da12bb3789b391cc28fac22a7936f205d07ecdea6ee53324e0'
            '2c3472c6471e4ddedd524f36fd84b76156090d1caca1e70e65fbad5ace859b82')
noextract=("$pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  rm -r "$pkgdir/usr/etc"
  install -Dm644 $srcdir/$pkgname.desktop "$pkgdir/usr/share/applications/nyaovim.desktop"
}
