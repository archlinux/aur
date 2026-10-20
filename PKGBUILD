# Maintainer: josca <aur.lalt1@quarkymailer.com>
pkgname=rwx-cli-bin
pkgver=3.36.1
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
sha256sums_x86_64=('8a88c69fe325d0f56cb21b61768969b6d20b13a87ce751c1b6a5ac0b50b36b62')
sha256sums_aarch64=('52b6877cb955f7ae4e3f4e8ff93751074637dddaaae43217c6f6a22a28f7a114')

package() {
  case "$CARCH" in
  x86_64) _bin="rwx-linux-x86_64" ;;
  aarch64) _bin="rwx-linux-aarch64" ;;
  esac

  install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/rwx"
  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
