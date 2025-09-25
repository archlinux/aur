# Maintainer: mst-mkt <mail@keito.dev>
pkgname=moocs-collect-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI tool to download lecture slides from INIAD MOOCs (binary release)"
arch=('x86_64')
url="https://github.com/yu7400ki/moocs-collect"
license=('MIT')
depends=('gcc-libs' 'glibc' 'dbus' 'openssl')
provides=('moocs-collect-cli' 'moocs-collect-cli-bin')
conflicts=('moocs-collect-cli-git' 'moocs-collect-cli')
source=(
  "https://github.com/yu7400ki/moocs-collect/releases/download/cli-v${pkgver}/collect-cli-linux-amd64"
  "https://raw.githubusercontent.com/yu7400ki/moocs-collect/cli-v${pkgver}/LICENSE"
)
sha256sums=('a9b32ad1a73e84da909067a3e2f829951afc5983fbbe8abbd21e930f0bbce331'
            'a0bb4c5c93518d9c85e109021ccc612ec134e7b7cce2b66fd60ddfb0a7874a9b')

package() {
  install -Dm755 collect-cli-linux-amd64 "$pkgdir/usr/bin/collect-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
