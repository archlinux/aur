#Maintainer: Juma7C9 <juri # dividebyzero # it>

pkgname=asus-ux32-fancontrol
_pkgname=fancontrol
pkgver=r7.845e464
pkgrel=2
pkgdesc="Scritps to control fans on Asus UX32A/VD with a temperature/speed curve"
arch=('any')
url="https://gist.github.com/Juma7C9/8292006"
license=('GPL')
depends=('acpi_call')
optdepends=('dkms')
source=($_pkgname::git+https://gist.github.com/8292006.git)
sha256sums=('SKIP')

pkgver() {
        cd $srcdir/$_pkgname
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd $srcdir/$_pkgname
	install -m 755 -D *.sh -t $pkgdir/usr/bin/
	install -m 755 -D fancontrol-sh.service -t $pkgdir/usr/lib/systemd/system/
}
