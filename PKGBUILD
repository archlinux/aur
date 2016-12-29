pkgname=jackett-public
pkgver=0.6.45.3
pkgrel=4
pkgdesc='Use any tracker with Sonarr (Public Tracker Version)'
arch=('any')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('mono' 'curl')
source=("https://github.com/dreamcat4/Jackett-public/releases/download/v${pkgver}/Jackett-public.Binaries.Mono.tar.gz"
        "jackett-public.service")
md5sums=('7ed61a1574a82b86ded63350dc4d5ba2'
         '8134aaa1cd553641345b9fce7990e529')
install=$pkgname.install

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/opt/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett-public"* "${pkgdir}/opt/"
    install -D -m644 "${srcdir}/jackett-public.service" "${pkgdir}/usr/lib/systemd/system/jackett-public.service"
    install -d -m755 "${pkgdir}/usr/share/Jackett"
}
