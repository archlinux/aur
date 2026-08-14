# Maintainer: René Jochum <r3j0@jochum.dev>
# Maintainer: Bastien 'neitsab' Traverse <neitsab@archlinux.org>

pkgname=incus-compose-bin
pkgver=1.2.0
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
sha256sums_x86_64=('828bfe5488c2d38034bf5703879d53adb0f63f9c2667f20ce5bb4d0ebb913d00')

source_aarch64=("https://github.com/lxc/incus-compose/releases/download/v$pkgver/incus-compose_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('efc78cc2a629fb159d6488e58074f5e59159e39cb4e6dc4b43ff503473d6d4b8')

package() {
  install -Dm755 "$srcdir/incus-compose" "$pkgdir/usr/bin/incus-compose"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
