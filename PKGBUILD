# Maintainer: josca <aur.lalt1@quarkymailer.com>
pkgname=rwx-cli-bin
pkgver=3.28.0
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
sha256sums_x86_64=('28a8ae92faeb41de12935fb9aa6e86692e95db8c919f02e54e904429a444ae5c')
sha256sums_aarch64=('2212219059b2b8438c85e4b74f8fa97ac826a61a5230466f7ed96bab5dfcc368')

package() {
  case "$CARCH" in
  x86_64) _bin="rwx-linux-x86_64" ;;
  aarch64) _bin="rwx-linux-aarch64" ;;
  esac

  install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/rwx"
  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
