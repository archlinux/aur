pkgname=jackett-public
pkgver=0.6.45.2
pkgrel=1
pkgdesc='Use any tracker with Sonarr (Public Tracker Version)'
arch=('any')
license=('GPL')
url='https://github.com/Jackett/Jackett'
conflicts=('jackett')
depends=('mono' 'curl')
source=('https://github.com/dreamcat4/Jackett-public/releases/download/v0.6.45.2/Jackett-public.Binaries.Mono.tar.gz'
'jackett.service')
md5sums=('8699545e98891d50ffef692b669d9f7e'
         'da51e3269b530a99da65e323eebd7f06')
install=$pkgname.install

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/opt/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett-public"* "${pkgdir}/opt/"
    install -D -m644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -d -m755 "${pkgdir}/usr/share/Jackett"
}
