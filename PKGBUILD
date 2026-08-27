# Maintainer: René Jochum <r3j0@jochum.dev>
# Maintainer: Bastien 'neitsab' Traverse <neitsab@archlinux.org>

pkgname=incus-compose-bin
pkgver=1.3.1
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
sha256sums_x86_64=('e7a87cd175a0d10b4cf30eab75f8f20095902e52a7db7cafcefe9dcdcdff69c6')

source_aarch64=("https://github.com/lxc/incus-compose/releases/download/v$pkgver/incus-compose_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('b728eee5b0a76da466f4141f2d22850dbf086e798100b5c9307dd12a7b8664ee')

package() {
  install -Dm755 "$srcdir/incus-compose" "$pkgdir/usr/bin/incus-compose"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
