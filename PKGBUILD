# Maintainer: René Jochum <r3j0@jochum.dev>
# Maintainer: Bastien 'neitsab' Traverse <neitsab@archlinux.org>

pkgname=incus-compose-bin
pkgver=1.1.0
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
sha256sums_x86_64=('7be727d246fb74951b8990d07836022db591ee0cd048b38f195bd3e94dc19fbb')

source_aarch64=("https://github.com/lxc/incus-compose/releases/download/v$pkgver/incus-compose_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('83a28394c06481c88f599e5ced523dc9e36de9e93a54052e9d5ac51057c80b6c')

package() {
  install -Dm755 "$srcdir/incus-compose" "$pkgdir/usr/bin/incus-compose"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
