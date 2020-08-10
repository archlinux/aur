#maintainer lxgr <lxgr@protonmail.com>
pkgname=xfce4-sysinfo
commit=4b855d608f0948b40af94581330d602a04927640
pkgver=152.${commit}
pkgrel=1
pkgdesc="A tool to show systeminformation in xfce"
arch=(any)
url="https://github.com/lxgr-linux/xfce4-sysinfo"
license=('GPL v3')
depends=('gtk3' 'gtkdialog' 'zenity')
makedepends=('git')

source=("xfce4-sysinfo.zip::https://github.com/lxgr-linux/xfce4-sysinfo/archive/${commit}.zip")
md5sums=('SKIP')

#pkgver() {
#	    cd "$pkgname"
#	        echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
#}

#prepare(){
#	cd "$srcdir/$pkgname-$commit"
#	chmod +x sysinfo
#}

package() {
	cd "$srcdir/$pkgname-$commit"
	install -dm755 "${pkgdir}/usr/share/pixmaps"

	install -Dm0644 -t "$pkgdir/etc" "xfce4-sysinfo.conf"
	install -Dm0644 -t "$pkgdir/usr/share/applications" "xfce4-sysinfo.desktop"
	install -Dm0644 icons/* "$pkgdir/usr/share/pixmaps"
	install -Dm0755 -t "$pkgdir/usr/bin" "sysinfo"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
