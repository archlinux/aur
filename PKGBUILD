# Maintainer: alejopek alejopek62@gmail.com
pkgname=sys-dashboard
pkgver=1.0.0
pkgrel=1
pkgdesc="A professional real-time system monitoring dashboard built with Node.js and Electron"
arch=('x86_64')
url="https://github.com/Alejopek/Sys-Dashboard-"
license=('ISC')
depends=('nodejs' 'npm')
makedepends=('git')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  npm install
  npx electron-builder --linux dir
}

package() {
  cd "$pkgname"
  install -dm755 "$pkgdir/opt/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  
  cp -r dist/linux-unpacked/* "$pkgdir/opt/$pkgname/"
  
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
