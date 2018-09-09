# Maintainer: TailRed <callum at twintailsare dot moe>
# Maintainer (Original package): Nattapong Pullkhow <ixenatt at gmail dot com>
# Contributor: Nattapong Pullkhow <ixenatt at gmail dot com>
# Contributor: Robbie <zoqaeski at gmail dot com>

pkgname=xenlism-wildfire-icon-theme-git
_themename=wildfire
pkgver=2018.05beta1.r26.g77c43c2
pkgrel=1
depends=('gtk-update-icon-cache')
makedepends=('git')
pkgdesc="Minimalism And Realism Mix and match, Meego And iOS icon Style"
url="https://xenlism.github.io/wildfire"
arch=("any")
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=("${pkgname}")
install=xenlism-wildfire.install
source=(${pkgname}'::git+https://github.com/xenlism/wildfire.git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
# Git, no tags available
	cd ${srcdir}/${pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"
	install -d "${pkgdir}/usr/share/icons/"
	cp -r icons $pkgdir/usr/share/
	find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
	find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
	#Install License
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/Xenlism-Widfire/LICENSE"
}
