pkgname=jackett-public
pkgver=0.6.45.3
pkgrel=1
pkgdesc='Use any tracker with Sonarr (Public Tracker Version)'
arch=('any')
license=('GPL')
url='https://github.com/Jackett/Jackett'
conflicts=('jackett')
depends=('mono' 'curl')
source=('https://github.com/dreamcat4/Jackett-public/releases/download/v0.6.45.3/Jackett-public.Binaries.Mono.tar.gz'
'jackett.service')
md5sums=('7ed61a1574a82b86ded63350dc4d5ba2'
         'da51e3269b530a99da65e323eebd7f06')
install=$pkgname.install

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/opt/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett-public"* "${pkgdir}/opt/"
    install -D -m644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -d -m755 "${pkgdir}/usr/share/Jackett"
}
