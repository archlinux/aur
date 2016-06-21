pkgname=jackett
pkgver=0.7.281
pkgrel=1
pkgdesc='User any tracker with Sonarr'
arch=('any')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('mono' 'curl')
source=('https://github.com/Jackett/Jackett/releases/download/v0.7.281/Jackett.Binaries.Mono.tar.gz' 
'jackett.service')
md5sums=('4fa7e1ca0f20ca60bf90a8553cafc75c'
         '5983ba69e0289be2c27ce9423df408ab')
install=$pkgname.install

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/opt/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett"* "${pkgdir}/opt/"
    install -D -m644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -d -m755 "${pkgdir}/usr/share/Jackett"
}
