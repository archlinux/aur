# Maintainer: Gabriel M. Dutra <me@sizeofnull.xyz>

pkgname=gonzo-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="The Go based TUI log analysis tool"
arch=('x86_64' 'aarch64')
url="https://github.com/control-theory/gonzo"
license=('MIT')
source_x86_64=("gonzo_${pkgver}_${CARCH}.gz::https://github.com/control-theory/gonzo/releases/download/v$pkgver/gonzo-$pkgver-linux-amd64.tar.gz")
source_aarch64=("gonzo_${pkgver}_aarch64.gz::https://github.com/control-theory/gonzo/releases/download/v$pkgver/gonzo-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('fde5908552a1158fa6e7cf9d4b3c87300ec099ad9eff800e7e39e035588be157')
sha256sums_aarch64=('1a3e268b7e8410c43210e8a9a5f126b8c088284e270e5d7872ff432e3a84d489')


check() {
  ./gonzo version
}

package() {
  cd "${srcdir}"
  install -Dm755 "gonzo" "$pkgdir/usr/bin/gonzo"
}

