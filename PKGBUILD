# Maintainer: josca <aur.lalt1@quarkymailer.com>
pkgname=rwx-cli-bin
pkgver=3.13.3
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
sha256sums_x86_64=('69d3ac654b027a957df279abf95eada6f279feeb1545a4a10c176e2b18a89d18')
sha256sums_aarch64=('8cff63ec49e097441e123cdc2be712e3f5955da89f4105eaf0cb5feee2fb1967')

package() {
  case "$CARCH" in
  x86_64) _bin="rwx-linux-x86_64" ;;
  aarch64) _bin="rwx-linux-aarch64" ;;
  esac

  install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/rwx"
  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
