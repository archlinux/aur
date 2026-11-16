# Maintainer: etoq <olhnts12@proton.me>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=tailwindcss
pkgver=4.3.5
pkgrel=1
pkgdesc="A utility-first CSS framework for rapidly building custom user interfaces."
arch=("any")
url="https://tailwindcss.com"
license=("MIT")
depends=('nodejs>=16.0.0' 'npm')
optdepends=()
source=("https://github.com/tailwindlabs/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('947cfdc23ff5c65c1b5d42b0df5ba33b2d00b4123deb0abefbd7729a1cbae0e978f4a9873fe7fcb219d83961e7fc7fd65e4c00837a31da2fb74918e6d62e5889')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  chown -R root:root "$pkgdir"
}
