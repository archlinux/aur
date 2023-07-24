# Maintainer: jdev082 <jdev0894@gmail.com>

pkgname=catalyst-browser-rc-bin
pkgver=3.5.0rc1
pkgrel=1
pkgdesc="Catalyst Web Browser"
arch=('x86_64')
url="https://getcatalyst.eu.org"
license=('MIT')
conflicts=('catalyst-browser-bin')
makedepends=('asar')
source=("https://github.com/CatalystDevOrg/Catalyst/releases/download/v3.5.0-rc.1/catalyst_3.5.0.rc.1_amd64.deb")
md5sums=("d2aa81c4446d0ffeee8f928521fd61b2")

prepare() {
  tar -xf "data.tar.zst"
  asar extract usr/lib/catalyst/resources/app.asar asar
  sed -i 's/catalyst-default-distrib/catalyst-default-archlinux/g' asar/src/index.html
  asar pack asar usr/lib/catalyst/resources/app.asar
}

package() {
  cp -r "usr" "$pkgdir"
}
