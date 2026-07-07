# Maintainer: josca <aur.lalt1@quarkymailer.com>
pkgname=rwx-cli-bin
pkgver=3.19.1
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
sha256sums_x86_64=('6abf53a35f58ded0b25ff563c56206b6e39082afc2ce71441cd0bf7891f7d619')
sha256sums_aarch64=('02525622dc33702dabd9feb2b78d60276e193f3e5aad9b782aa836c1838de809')

package() {
  case "$CARCH" in
  x86_64) _bin="rwx-linux-x86_64" ;;
  aarch64) _bin="rwx-linux-aarch64" ;;
  esac

  install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/rwx"
  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
