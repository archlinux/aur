# Maintainer: éclairevoyant
# Contributor: Adam S Levy <adam at aslevy dot com>

pkgname=xrasengan
pkgver=1.0.0.r1.3c3bb5c
pkgrel=2
pkgdesc="XRandR wrapper to make your multi-monitor setup easier"
arch=(any)
url="https://github.com/geyslan/$pkgname"
license=(Apache)
depends=(arandr bash coreutils libnotify xorg-xrandr)
makedepends=(git)
source=("git+$url.git#commit=3c3bb5ce660d8f4a659d8b4ed2138b40539473a7")
b2sums=('SKIP')

pkgver() {
	git -C $pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

package() {
	cd $pkgname
	install -vDm755 $pkgname -t "$pkgdir/usr/bin/$pkgname"
	install -vDm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -vDm644 ${pkgname}_complete "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
