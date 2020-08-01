# Maintainer: Kiriakos Krastillis <kappa@kindstudios.gr>
pkgname=notify-broadcast-git
pkgver=0.9.r5.a3055bd
pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "0.9.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Broadcast desktop notifications to all users having a graphical DBUS session"
arch=('any')
url="https://github.com/kiriakos/notify-broadcast"
license=('GPL')
depends=('libnotify' 'sed' 'findutils' 'coreutils' 'binutils' 'grep')
makedepends=('git')
source=('git+https://github.com/kiriakos/notify-broadcast.git')
md5sums=('SKIP')

package() {
	cd "$srcdir/${pkgname%-git}"
  install -Dm700 -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname%-git}/notify-broadcast" 
}
