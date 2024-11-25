pkgname=grub-btrfs-autogenerate
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
url="https://aur.archlinux.org/packages/grub-btrfs-autogenerate"
license=('EULA')
depends=('grub' 'grub-btrfs' 'snapper' 'systemd')
makedepends=('git')
pkgdesc="Autogenerate GRUB BTRFS menu"
source=("grub-btrfs-autogenerate.service"
        "grub-btrfs-autogenerate.timer")
sha256sums=('73eb6a84e0faac68eae5b62a6225d87b202857e2c0031a00f41a358d5ce430ca'
            '9bcf178d033dc301cd2f723661b54caf7d20cc52f1ba69bcd5ed04548d3bb48e')

package() {
    ## Install Service
    install -Dm644 "$srcdir/grub-btrfs-autogenerate.service" "$pkgdir/etc/systemd/system/grub-btrfs-autogenerate.service"

    ## Install Timer
    install -Dm644 "$srcdir/grub-btrfs-autogenerate.timer" "$pkgdir/etc/systemd/system/grub-btrfs-autogenerate.timer"
}
