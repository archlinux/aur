# Maintainer: Brandon Giesing <brandon@giesing.cf>

pkgname=jackett
pkgver=0.6.4
pkgrel=0
pkgdesc='User any tracker with Sonarr'
arch=('any')
license=('GPL')
url='https://github.com/zone117x/Jackett'
depends=('mono' 'curl')
source=('https://jackett.net/Download/v0.6.4/Jackett.Mono.v0.6.4.tar.bz2' 'jackett.service')
md5sums=('c6af839062ccadcc7e6ed0f971caf3c3'
         '5983ba69e0289be2c27ce9423df408ab')
install=$pkgname.install

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/opt/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett"* "${pkgdir}/opt/"
    install -D -m644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -d -m755 "${pkgdir}/usr/share/Jackett"
}
