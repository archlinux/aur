# Maintainer: mst-mkt <mail@keito.dev>
pkgname=moocs-collect-cli-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="CLI tool to download lecture slides from INIAD MOOCs (binary release)"
arch=('x86_64')
url="https://github.com/yu7400ki/moocs-collect"
license=('MIT')
depends=('gcc-libs' 'glibc' 'dbus' 'openssl-3')
provides=('moocs-collect-cli' 'moocs-collect-cli-bin')
conflicts=('moocs-collect-cli-git' 'moocs-collect-cli')
source=(
  "https://github.com/yu7400ki/moocs-collect/releases/download/cli-v${pkgver}/collect-cli-linux-amd64"
  "https://raw.githubusercontent.com/yu7400ki/moocs-collect/cli-v${pkgver}/LICENSE"
)
sha256sums=('02673e7fd99fc73e809514deea8b5fac48c9c1032a6cd97f4389919106bf87fc'
            'a0bb4c5c93518d9c85e109021ccc612ec134e7b7cce2b66fd60ddfb0a7874a9b')

package() {
  install -Dm755 collect-cli-linux-amd64 "$pkgdir/usr/bin/collect-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
