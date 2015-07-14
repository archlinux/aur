# Maintainer: Brandon Giesing <brandon@giesing.cf>

pkgname=jackett
pkgver=0.4.3
pkgrel=1
pkgdesc='User any tracker with Sonarr'
arch=('any')
license=('GPL')
url='https://github.com/zone117x/Jackett'
depends=('mono' 'curl')
source=('https://github.com/zone117x/Jackett/releases/download/v0.4.3/Release.v0.4.3.zip' 'jackett.service')
md5sums=('160840fd3cf7fbc29c1e5ab6dec5e021'
         'bfefcb47a83a216e223dbc1294d03e0c')
install=$pkgname.install

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/opt/Jackett"
    cp -dpr --no-preserve=ownership "${srcdir}/Release/"* "${pkgdir}/opt/Jackett"
    install -D -m644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -d -m755 "${pkgdir}/usr/share/Jackett"
}
