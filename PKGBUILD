# Maintainer: Thomas Holden <thomas@tholden.no>
pkgname=zenbook-sound-fix-ux3405ma
pkgver=1.0.0
pkgrel=2
pkgdesc="SSDT Patch to fix missing speakers sound in Linux on Asus Zenbook 14 UX3405MA (2024) and latest BIOS"
arch=("x86_64")
url="https://github.com/smallcms/asus_zenbook_ux3405ma"
license=("unknown")
install="asua_zenbook_ux3405ma.install"
depends=("grub")
makedepends=("git" "acpica")
source=("git+https://github.com/smallcms/asus_zenbook_ux3405ma.git")
md5sums=('SKIP')

build() {
    iasl -tc $srcdir/asus_zenbook_ux3405ma/ssdt-csc3551.dsl
}

package() {
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/ssdt-csc3551.aml "$pkgdir/boot/ssdt-csc3551.aml"
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/01_acpi "$pkgdir/etc/grub.d/01_acpi"
}
sha256sums=('SKIP')
