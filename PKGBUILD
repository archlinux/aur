pkgname=jackett
pkgver=0.7.232
pkgrel=1
pkgdesc='User any tracker with Sonarr'
arch=('any')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('mono' 'curl')
source=('https://github.com/Jackett/Jackett/releases/download/v0.7.232/Jackett.Binaries.Mono.tar.gz' 'jackett.service')
md5sums=('fba9fd819aede513c0c795453648a3a0'
         '5983ba69e0289be2c27ce9423df408ab')
install=$pkgname.install

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/opt/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett"* "${pkgdir}/opt/"
    install -D -m644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -d -m755 "${pkgdir}/usr/share/Jackett"
}
