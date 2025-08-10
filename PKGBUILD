# Maintainer: aksh1618 <aakarshituppal at gmail dot com>
pkgname=kobweb
pkgver=0.9.21
pkgrel=1
pkgdesc='Set up and manage your Kobweb-enhanced Compose HTML app'
arch=('any')
url='https://kobweb.varabyte.com/'
license=('APACHE')
depends=('sh'
         'java-runtime>=11')
source=("https://github.com/varabyte/kobweb-cli/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar"
        "${pkgname}")
sha256sums=('77eaed4efe86618dc6e6e31f990490dd78174bc6d38b4251133c65a73e96c773'
            '9a7574f298111c7f1941f80f5b41745c650267d55e5a76f3e963e53dfdbebc84')

package() {
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/lib/"* -t "$pkgdir/usr/share/java/kobweb/"
  sed -i "s/{pkgver}/${pkgver}/g" "${srcdir}/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
