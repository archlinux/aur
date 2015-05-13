# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Jacco Koning <archlinux@menollo.nl>

pkgname=tritium
pkgver=0.3.5
pkgrel=5
pkgdesc="tritium is a tiling/tabbed window manager for the X Window System inspired by the ion window manager. It was written completely from scratch in Python and shares no actual code with ion."
arch=('any')
url="http://sourceforge.net/projects/tritium/"
license=('GPL')
depends=('python2-xlib' 'plwm-svn')
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3b1f9e5823cf76178a9ca9842486a8e6')


package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	python2 setup.py install --root=${pkgdir} --prefix=/usr

	# install desktop file so you can start tritium from your login manager
	install -Dm644 extras/${pkgname}.desktop ${pkgdir}/usr/share/xsessions/${pkgname}.desktop
}
