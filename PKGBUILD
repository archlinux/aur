# Maintainer: Aaron Coach <aur at ezpz dot cz>

_npmname=nodemailer
_npmver=6.7.5
pkgname=nodejs-nodemailer
pkgver=6.7.5
pkgrel=1
pkgdesc="Send e-mails with Node.JS – easy as cake!"
arch=(any)
url="https://nodemailer.com/"
license=(MIT)
makedepends=('npm')
depends=('nodejs<18.1.0')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
sha256sums=('4ae1b9486449740f4021c675a856d4025e42d118758deb6364f27127443fc102')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
