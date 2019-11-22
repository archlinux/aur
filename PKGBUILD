# Maintainer: Donald Webster <fryfrog@gmail.com>
pkgname="ubooquity"
pkgver="2.1.2"
pkgrel=1
pkgdesc="Home server for comics and ebooks."
arch=(any)
url="https://vaemendis.net/ubooquity/"
license=('custom')
depends=('java-runtime-headless>=8')
optdepends=('java-runtime: For Ubooquity GUI')
source=("http://vaemendis.net/ubooquity/downloads/Ubooquity-${pkgver}.zip"
        'ubooquity.service'
        'ubooquity.sysusers'
        'ubooquity.tmpfiles')

sha512sums=('47ed82796ffa7af917d93832e7aced7cd2456b17b8c8671fe71682267df72d8b9df2eb0e8f1cd44f2781a0ad68c5d6522fca67bffbae572cf25a9ab939453442'
            'e46ec0e8e903ca1e21e824c420e237c4fb894047c1bfa6385ebb9b49843237355dfb92ebe57518c8620ab46928cfe0b41c4dc7cacbeb01ef1410495d19fc5f3c'
            'd4165d6e22b5e15e308f197ba1193b9a8724a327622f41af0baf451053b55b0280cddcea96e2d16772d7f055a980336de8459b43687431aacec9d164dc63eb9e'
            'b3184a77493e23cdbfaecc28454053186097be4e6f436289e92268dc322b04460417f57cbe280cb820da5bff55e9af2e70b3c7c9beb22ce525f45a1f3426845a')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/ubooquity"
  cp -dpr --no-preserve=ownership "${srcdir}/Ubooquity.jar" "${pkgdir}/usr/lib/ubooquity"

  install -D -m 644 "${srcdir}/ubooquity.service" "${pkgdir}/usr/lib/systemd/system/ubooquity.service"
  install -D -m 644 "${srcdir}/ubooquity.sysusers" "${pkgdir}/usr/lib/sysusers.d/ubooquity.conf"
  install -D -m 644 "${srcdir}/ubooquity.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ubooquity.conf"
}
