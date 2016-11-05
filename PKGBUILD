pkgname=aria2d
pkgver=1.1
pkgrel=2
pkgdesc='Daemonize aria2'
license=('GPL2')
arch=(any)
depends=('aria2')
provides=('aria2c-daemon')
conflicts=('aria2c-daemon')
replaces=('aria2c-daemon')
makedepends=('git')
url='https://github.com/MikalaiR/aria2d'
install=$pkgname.install
source=("git+https://github.com/MikalaiR/aria2d.git")
md5sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	install -D -m644 "./aria2.conf"     	"${pkgdir}/etc/conf.d/aria2.conf"
	install -D -m644 "./aria2d.service" 	"${pkgdir}/usr/lib/systemd/system/aria2d.service"
}