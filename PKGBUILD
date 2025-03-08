# Maintainer: Recolic Keghart <root@recolic.net>
# Original repo: https://git.recolic.net/root/shared-bootdir-helper
# Mirror: https://github.com/recolic/shared-bootdir-helper

pkgname=shared-bootdir-helper
pkgver=1.3.1
pkgrel=3
pkgdesc="Allow multiple linux installations to share the same /boot directory, even with different kernel parameters. (GRUB only)"
url="https://git.recolic.net/root/$pkgname"
license=("GPL3")
arch=("any")
depends=("bash" "sed" "grep" "mkinitcpio")
install="$pkgname.install"
backup=(etc/shared-bootdir-helper-multi-kparam.cfg)
source=(
    "$pkgname::git+https://git.recolic.net/root/$pkgname.git"
)
validpgpkeys=("6861D89984E7887F0FFE6E08C344D5EAE3933636")
sha256sums=(
    "SKIP"
)

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/etc" "$pkgdir/usr/bin" "$pkgdir/usr/share/libalpm/hooks" "$pkgdir/usr/share/libalpm/scripts" &&
    mv src/*.cfg "$pkgdir/etc/" &&
    mv src/hook-*.sh "$pkgdir/usr/share/libalpm/scripts/" &&
    mv src/*.sh "$pkgdir/usr/bin/" &&
    mv src/*.hook "$pkgdir/usr/share/libalpm/hooks/" ||
    return $?
}

