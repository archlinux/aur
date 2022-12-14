# Maintainer: Tang Yuming <felinae225@qq.com>
pkgname=clashup
pkgver=0.3.0
pkgrel=3
pkgdesc="auto update clash's config file"
license=('GPL')
arch=('any')
url="https://github.com/felinae98/clashup"
depends=(python
         clash
         python-requests
         python-daemon)
source=(clashup clashup.conf clashup.service clashup.timer)
package() {
    install -Dm755 clashup ${pkgdir}/usr/bin/clashup
    install -Dm644 clashup.conf ${pkgdir}/etc/systemd/user/clash.service.d/clashup.conf
    install -Dm644 clashup.service ${pkgdir}/usr/lib/systemd/system/clashup.service
    install -Dm644 clashup.timer ${pkgdir}/usr/lib/systemd/system/clashup.timer
}
md5sums=('c8e16b6a739ab9e4ab5bf13d66faa975'
         '177338346005e11d33e27edc1f8ab780'
         'f805be578902fb8c6606aef828111af8'
         '58604e2d881d0260623659ce06158e14')
