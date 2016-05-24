pkgname=jackett-public
pkgver=0.6.45
pkgrel=1
pkgdesc='User any tracker with Sonarr (Public Tracker Version)'
arch=('any')
license=('GPL')
url='https://github.com/Jackett/Jackett'
conflicts=('jackett')
depends=('mono' 'curl')
source=('https://github.com/Jackett/Jackett/releases/download/v0.6.45/Jackett.Binaries.Mono.tar.gz' 
'jackett.service')
md5sums=('fa0fbff84b4ccea189d5fe0ce83f73a4'
         '5983ba69e0289be2c27ce9423df408ab')
install=$pkgname.install

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/opt/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett"* "${pkgdir}/opt/"
    install -D -m644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -d -m755 "${pkgdir}/usr/share/Jackett"
}
