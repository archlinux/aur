# Maintainer: Chiro2001 <Chiro2001@163.com>
pkgname=clashup-yacd
pkgver=0.3.0
pkgrel=4
pkgdesc="auto update clash's config file, compatible with yacd"
license=('GPL')
arch=('any')
url="https://github.com/chiro2001/clashup-yacd"
depends=(python
         clash
         python-requests
         python-daemon
         yacd)
conflicts=(clashup)
source=(clashup clashup.conf clashup.service clashup.timer)
package() {
    install -Dm755 clashup ${pkgdir}/usr/bin/clashup
    install -Dm644 clashup.conf ${pkgdir}/etc/systemd/user/clash.service.d/clashup.conf
    install -Dm644 clashup.service ${pkgdir}/usr/lib/systemd/system/clashup.service
    install -Dm644 clashup.timer ${pkgdir}/usr/lib/systemd/system/clashup.timer
}
md5sums=('ef6bed643606b09331509cd7344a348c'
         '177338346005e11d33e27edc1f8ab780'
         'f805be578902fb8c6606aef828111af8'
         '58604e2d881d0260623659ce06158e14')
