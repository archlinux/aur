# Maintainer: Brandon Giesing <brandon@giesing.cf>

pkgname=jackett
pkgver=0.6.0
pkgrel=3
pkgdesc='User any tracker with Sonarr'
arch=('any')
license=('GPL')
url='https://github.com/zone117x/Jackett'
depends=('mono' 'curl')
source=('https://github.com/zone117x/Jackett/releases/download/v0.6.0/Jackett.Mono.v0.6.0.tar.bz2' 'jackett.service')
md5sums=('007633ae31f52a86381df755518c81cf'
         '5983ba69e0289be2c27ce9423df408ab')
install=$pkgname.install

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/opt/Jackett"
    cp -dpr --no-preserve=ownership "${srcdir}/"* "${pkgdir}/opt/Jackett"
    install -D -m644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -d -m755 "${pkgdir}/usr/share/Jackett"
}
