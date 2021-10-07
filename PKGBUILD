pkgname=udev-uaccess-fix
pkgver=1
pkgrel=1
pkgdesc="Workaround for udev's uaccess ACL hack, to give all users access to devices"
arch=(any)
url="https://github.com/sandsmark"
depends=(udev)
license=(GPL3)
source=("udev-uaccess-fix.rules")
md5sums=("SKIP") # handled by git

package() {
    # Run first, so if any other rules set a group this is overridden
    install -D -m644 udev-uaccess-fix.rules "${pkgdir}/usr/lib/udev/rules.d/00-udev-uaccess-fix.rules"
}
