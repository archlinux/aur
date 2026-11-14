# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=hyprdown-bin
_pkgname=hyprdown
pkgver=0.3.1
pkgrel=1
pkgdesc='Close every app running under Hyprland without user input, then exit, power off, reboot or log out (prebuilt)'
arch=('x86_64')
url='https://github.com/TheElevatedOne/hyprdown'
license=('BSD-3-Clause')
depends=(
  'glibc'
  'json-c'
  'systemd'
  'systemd-libs'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# Built by the upstream release workflow.
options=('!debug')
source=(
  "$_pkgname-$pkgver-linux.tar.gz::$url/releases/download/$pkgver/$_pkgname-$pkgver-linux.tar.gz"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/TheElevatedOne/$_pkgname/refs/tags/$pkgver/LICENSE"
  "README-$pkgver.md::https://raw.githubusercontent.com/TheElevatedOne/$_pkgname/refs/tags/$pkgver/README.md"
)
sha256sums=('d798304971c154f8b9d42e102f4f1781e43c32851ebd8fab751cc71ab02a9336'
            '953ddedbcd7b01e88a78f928a55b83ae1edc8436e2bbbca3a25a29a0660df143'
            '1b9f8ce2a48db7edafb1daced94f2c191209fd8b149466dff12843ecc7893863')

package() {
  install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
