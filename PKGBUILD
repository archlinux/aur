# Maintainer: jdev082 <jdev0894@gmail.com>

pkgname=catalyst-browser-bin
pkgver=3.4.10
pkgrel=1
pkgdesc="Catalyst Web Browser"
arch=('x86_64')
url="https://getcatalyst.eu.org"
license=('MIT')
makedepends=('asar')
source=("https://github.com/CatalystDevOrg/Catalyst/releases/download/v${pkgver}/catalyst_${pkgver}_amd64.deb")
md5sums=("SKIP")

prepare() {
  tar -xf "data.tar.zst"
  asar extract usr/lib/catalyst/resources/app.asar asar
  sed -i 's/catalyst-default-distrib/catalyst-default-archlinux/g' asar/src/index.html
  asar pack asar usr/lib/catalyst/resources/app.asar
}

package() {
  cp -r "usr" "$pkgdir"
}