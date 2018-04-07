# Maintainer: Martin Panter <vadmium à gmail·com>
_name=dir
pkgname="mkinitcpio-$_name"
pkgver=0.2.0
pkgrel=0
pkgdesc="Initcpio hook to mount a subdirectory as the root file system"
url="https://bbs.archlinux.org/viewtopic.php?pid=932362#p932362"
arch=(any)
license=("custom:Public domain")
depends=(mkinitcpio)
source=(README.md hook install)
md5sums=(SKIP SKIP SKIP)

package() {
  local DEST=(
    "usr/share/doc/$pkgname/README.md"
    "usr/lib/initcpio/hooks/$_name"
    "usr/lib/initcpio/install/$_name"
  )
  for((i = 0; i < "${#source[@]}"; ++i)); do
    mkdir -p "$pkgdir/$(dirname "${DEST[i]}")"
    install -Dm644 "$srcdir/${source[i]}" "$pkgdir/${DEST[i]}"
  done
}
