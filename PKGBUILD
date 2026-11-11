# Maintainer: René Jochum <r3j0@jochum.dev>
# Maintainer: Bastien 'neitsab' Traverse <neitsab@archlinux.org>

pkgname=incus-compose-bin
pkgver=1.4.0
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
sha256sums_x86_64=('3dbb65a4f9d8bde671248311f1c78309f582fb8fa81436795895a55c2f7a9a18')

source_aarch64=("https://github.com/lxc/incus-compose/releases/download/v$pkgver/incus-compose_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('1ff983f4d6bf47677d451bcf97bbef4339fdc727fd5e864784cde7580d34fe96')

package() {
  install -Dm755 "$srcdir/incus-compose" "$pkgdir/usr/bin/incus-compose"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
