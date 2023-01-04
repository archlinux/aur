# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=xfce4-theme-switcher
pkgver=0.1
pkgrel=6
pkgdesc="Utility for fast switch betwen Xfce4 themes."

arch=('any')
url="https://gitlab.com/linux-stuffs/xfce4-theme-switcher"
license=('GPL3')
groups=('xfce4-goodies' 'xfce4-goodies-devel')

provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('bash' 'xfce4-whiskermenu-plugin' 'coreutils' 'grep' 'sed' 'python3' 'conky' 'plank' 'xfce4-panel' 'gtk3' 'python-gobject>=3.38')
options=('!strip')

source=('https://gitlab.com/linux-stuffs/xfce4-theme-switcher/raw/master/distrib/xfce4-theme-switcher-0.1-6.tar.gz')
sha256sums=('SKIP')


package() {
	cd "${srcdir}/${pkgname}"
	./configure  --prefix=/usr
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
