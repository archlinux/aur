#maintainer lxgr <lxgr@protonmail.com>
pkgname=xfce4-sysinfo
pkgver=152.0.1
pkgrel=1
pkgdesc="A tool to show systeminformation in xfce"
arch=(any)
url="https://github.com/lxgr-linux/xfce4-sysinfo"
license=('GPL3')
depends=('gtk3' 'gtkdialog' 'zenity')
makedepends=('git')

source=("xfce4-sysinfo.tar.gz::https://github.com/lxgr-linux/xfce4-sysinfo/archive/${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -dm755 "${pkgdir}/usr/share/pixmaps"
	install -Dm0644 -t "$pkgdir/etc" "xfce4-sysinfo.conf"
	install -Dm0644 -t "$pkgdir/usr/share/applications" "xfce4-sysinfo.desktop"
	install -Dm0644 icons/* "$pkgdir/usr/share/pixmaps"
	install -Dm0755 -t "$pkgdir/usr/bin" "sysinfo"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
