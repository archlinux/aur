# Maintainer: René Jochum <r3j0@jochum.dev>
# Maintainer: Bastien 'neitsab' Traverse <neitsab@archlinux.org>

pkgname=incus-compose-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="Bring the familiar Docker Compose workflow to Incus containers (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/lxc/incus-compose"
license=('Apache-2.0')
depends=('incus')
optdepends=(
  'podman: build service images locally with `incus-compose build`'
  'docker: build service images locally with `incus-compose build`'
)
provides=('incus-compose')
conflicts=('incus-compose' 'incus-compose-git')

source_x86_64=("https://github.com/lxc/incus-compose/releases/download/v$pkgver/incus-compose_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('9624f19675eb211fb537ee9f7e92408c40833dd51fc954eb06ea38a8e4060f93')

source_aarch64=("https://github.com/lxc/incus-compose/releases/download/v$pkgver/incus-compose_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('92e76c5f1a50b91a341c5318a78988e66b8f6c662226c0b0720a75c3bb1ca49d')

package() {
  install -Dm755 "$srcdir/incus-compose" "$pkgdir/usr/bin/incus-compose"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
