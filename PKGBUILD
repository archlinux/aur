# Maintainer: Brandon Giesing <brandon@giesing.cf>

pkgname=jackett
pkgver=0.5.0
pkgrel=2
pkgdesc='User any tracker with Sonarr'
arch=('any')
license=('GPL')
url='https://github.com/zone117x/Jackett'
depends=('mono' 'curl')
source=('https://github.com/zone117x/Jackett/releases/download/v0.5.0/Jackett.v0.5.zip' 'jackett.service')
md5sums=('8f27f738e94c00e253a8111a370f4586'
         '5983ba69e0289be2c27ce9423df408ab')
install=$pkgname.install

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/opt/Jackett"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett/"* "${pkgdir}/opt/Jackett"
    install -D -m644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -d -m755 "${pkgdir}/usr/share/Jackett"
}
