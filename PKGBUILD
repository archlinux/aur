# Maintainer: Edward Toroshchyn <aur@hades.name>
pkgname=flipper-authenticator-companion
pkgver=2.9.7
pkgrel=1
pkgdesc="A companion app for Flipper Zero Authenticator app"
arch=('x86_64')
url="https://github.com/akopachov/flipper-zero_authenticator-companion"
license=('GPL-3')
depends=('nodejs')
makedepends=('pnpm')
source=('https://github.com/akopachov/flipper-zero_authenticator-companion/archive/refs/tags/v2.9.7.tar.gz')
sha256sums=('50f687030311dd7db96c28d8dd83891892d7d02d7a43adcfbaa89855fd29aebd')

package() {
  _root="$srcdir/flipper-zero_authenticator-companion-${pkgver}"
  cd "$_root"
  pnpm config set node-linker hoisted --location project
  pnpm install
  pnpm build
  mkdir -p "$pkgdir/opt"
  cp -r "$_root/dist/linux-unpacked" "$pkgdir/opt/flipper-authenticator-companion"
}
