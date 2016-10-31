pkgname=aria2d
pkgver=1.0
pkgrel=1
pkgdesc='Daemonize aria2'
license=('GPL2')
arch=(any)
depends=('aria2')
conflicts=('aria2c-daemon')
replaces=('aria2c-daemon')
makedepends=('git')
url='https://github.com/MikalaiR/aria2d'
install=$pkgname.install
source=("git+https://github.com/MikalaiR/aria2d.git")
md5sums=('SKIP')

package() {
    msg 'package ...'
    install -D -m600 "${srcdir}/${pkgname}/aria2.conf"     "${pkgdir}/etc/conf.d/aria2.conf"
    install -D -m755 "${srcdir}/${pkgname}/aria2d.service" "${pkgdir}/etc/systemd/system/aria2d.service"
}