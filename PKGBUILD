# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
_npmname=ttystudio
pkgname=nodejs-$_npmname
pkgver=0.0.11
pkgrel=1
pkgdesc='A terminal-to-gif recorder minus the headaches'
arch=('any')
url="https://github.com/chjj/$_npmname"
license=('ISC')
depends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
md5sums=('0d80718c198c91a6f60b3b9be6b7a5a0')
sha256sums=('6aeda92c19cbd58ecafb0ed8f879d4c1c1652596398c5e6073ba69026f7abb47')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

