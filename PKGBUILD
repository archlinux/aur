# Maintainer: aksh1618 <aakarshituppal at gmail dot com>
pkgname=kobweb
pkgver=0.9.15
pkgrel=1
pkgdesc='Set up and manage your Kobweb-enhanced Compose HTML app'
arch=('any')
url='https://kobweb.varabyte.com/'
license=('APACHE')
depends=('sh'
         'java-runtime>=11')
source=("https://github.com/varabyte/kobweb-cli/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar"
        "${pkgname}")
sha256sums=('69bd8bcc86fcd030c31febb51a3803e7288dedb541d3430ce3c7d12f0f27348c'
            '9a7574f298111c7f1941f80f5b41745c650267d55e5a76f3e963e53dfdbebc84')

package() {
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/lib/"* -t "$pkgdir/usr/share/java/kobweb/"
  sed -i "s/{pkgver}/${pkgver}/g" "${srcdir}/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
