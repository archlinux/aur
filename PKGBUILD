# Maintainer: Brandon Giesing <brandon@giesing.cf>

pkgname=jackett
pkgver=0.3.1
pkgrel=1
pkgdesc='User any tracker with Sonarr'
arch=('any')
license=('GPL')
url='https://github.com/zone117x/Jackett'
depends=('mono' 'curl')
source=('https://github.com/zone117x/Jackett/releases/download/v0.3.1/Release.v0.3.1.zip' 'jackett.service')
md5sums=('08a7b51dcdddfbbb0487aba455ce72d4'
         'bfefcb47a83a216e223dbc1294d03e0c')
install=$pkgname.install

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/opt/Jackett"
    cp -dpr --no-preserve=ownership "${srcdir}/Release/"* "${pkgdir}/opt/Jackett"
    install -D -m644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -d -m755 "${pkgdir}/usr/share/Jackett"
}
