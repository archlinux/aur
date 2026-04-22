# Maintainer: josca <aur.lalt1@quarkymailer.com>
pkgname=rwx-cli-bin
pkgver=3.13.1
pkgrel=1
pkgdesc='CLI for RWX, an agent-native cloud platform powered by a new container runtime'
arch=('x86_64' 'aarch64')
url='https://github.com/rwx-cloud/rwx'
license=('MIT')
depends=('glibc')
provides=('rwx')
conflicts=('rwx')

_base_url="https://github.com/rwx-cloud/rwx/releases/download/v${pkgver}"

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/rwx-cloud/rwx/v${pkgver}/LICENSE")
source_x86_64=("${_base_url}/rwx-linux-x86_64")
source_aarch64=("${_base_url}/rwx-linux-aarch64")

sha256sums=('SKIP')
sha256sums_x86_64=('8db39cf93e36f6c4c6a5d784a9a43e15e7758271399f1e32da12e2aaeb4d8552')
sha256sums_aarch64=('b946d05149a7058d818a997199ca73f0fc22ea2a1eaa14514d2c7c33ad71046c')

package() {
  case "$CARCH" in
  x86_64) _bin="rwx-linux-x86_64" ;;
  aarch64) _bin="rwx-linux-aarch64" ;;
  esac

  install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/rwx"
  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
