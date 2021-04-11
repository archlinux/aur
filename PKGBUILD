# Maintainer: Antonín Dach <dach@protonmail.com>

pkgname=librewolf-comment-out-cfg-hook
pkgver=1
pkgrel=5
pkgdesc='Comment out custom cfg values via pacman hook'
arch=(x86_64 aarch64)
url='https://git.sr.ht/~freed00m/librewolf-comment-out-cfg-hook'
license=('MIT')
depends=(librewolf)

package() {
  mkdir -p "$pkgdir/usr/share/libalpm/scripts/"
  mkdir -p "$pkgdir/usr/share/libalpm/hooks/"

  cp ../librewolf-cfg-comment-out-values.hook "$pkgdir/usr/share/libalpm/hooks/librewolf-cfg-comment-out-values.hook"
  cp ../librewolf-cfg-uncomment-out-values.hook "$pkgdir/usr/share/libalpm/hooks/librewolf-cfg-uncomment-out-values.hook"
  cp ../librewolf-cfg-comment-out-values.sh "$pkgdir/usr/share/libalpm/scripts/librewolf-cfg-comment-out-values.sh"
  cp ../librewolf-cfg-uncomment-out-values.sh "$pkgdir/usr/share/libalpm/scripts/librewolf-cfg-uncomment-out-values.sh"

  # Set executable afterwards
  chmod +x "$pkgdir/usr/share/libalpm/scripts/librewolf-cfg-uncomment-out-values.sh"
  chmod +x "$pkgdir/usr/share/libalpm/scripts/librewolf-cfg-comment-out-values.sh"
}

# vim: ts=2 sw=2 et:
