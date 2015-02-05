# Maintainer: lh <jarryson AT gmail com>

pkgname=compiz-indicator
pkgver=0.2
pkgrel=4
pkgdesc='Control the seperate elements of your Window manager and Decorators, all from your Indicator tray.'
arch=('any')
url='http://gnome-look.org/content/show.php?content=132352'
license=('GPL')
groups=('lh' 'ayatana')
depends=('python2' 'hicolor-icon-theme')
install=compiz-indicator.install
source=("http://gnome-look.org/CONTENT/content-files/132352-compiz-indicator-v${pkgver}.tar.gz")
md5sums=('93d45c5e2115c914864275cc15fa24f5')

package()
{
	cd "${srcdir}/${pkgname}"
	install -Dm755 compiz-indicator "${pkgdir}/usr/bin/compiz-indicator"
	sed 's@#!/usr/bin/env python@#!/usr/bin/env python2@' -i "${pkgdir}/usr/bin/compiz-indicator"
	install -Dm644 fusion-icon-dark.svg "${pkgdir}/usr/share/icons/ubuntu-mono-dark/apps/24/fusion-icon.svg"
	install -Dm644 fusion-icon-light.svg "${pkgdir}/usr/share/icons/ubuntu-mono-light/apps/24/fusion-icon.svg"
	install -Dm644 fusion-icon-light.svg "${pkgdir}/usr/share/icons/hicolor/24x24/apps/fusion-icon.svg"
}
