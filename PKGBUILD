# Maintainer: Gabriel M. Dutra <me@sizeofnull.xyz>

pkgname=gonzo-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="The Go based TUI log analysis tool"
arch=('x86_64' 'aarch64')
url="https://github.com/control-theory/gonzo"
license=('MIT')
source_x86_64=("gonzo_${pkgver}_${CARCH}.gz::https://github.com/control-theory/gonzo/releases/download/v$pkgver/gonzo-$pkgver-linux-amd64.tar.gz")
source_aarch64=("gonzo_${pkgver}_aarch64.gz::https://github.com/control-theory/gonzo/releases/download/v$pkgver/gonzo-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('119f687d2c9a62aa21e2992f4db129a774e8251bc16851a9efc4a8ea3f45e394')
sha256sums_aarch64=('732fe2549334ba410cd5c6af24135bfc4e497adb175efe3f9dc29fbb1612efa9')


check() {
  ./gonzo version
}

package() {
  cd "${srcdir}"
  install -Dm755 "gonzo" "$pkgdir/usr/bin/gonzo"
}

