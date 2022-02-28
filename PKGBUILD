# Maintainer: aksh1618 <aakarshituppal at gmail dot com>
pkgname=kobweb
pkgver=0.9.7
pkgrel=1
pkgdesc='Set up and manage your Compose for Web app'
arch=('any')
url='https://kobweb.varabyte.com/'
license=('APACHE')
depends=('sh'
         'java-runtime>=11')
source=("https://github.com/varabyte/kobweb/releases/download/cli-v${pkgver}/${pkgname}-${pkgver}.tar"
        "${pkgname}")
sha256sums=('d4ca947ed24490828a7b20f2d29daff29412904aac81d3cc6c0e8cde2a84bafb'
            '9a7574f298111c7f1941f80f5b41745c650267d55e5a76f3e963e53dfdbebc84')

package() {
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/lib/"* -t "$pkgdir/usr/share/java/kobweb/"
  sed -i "s/{pkgver}/${pkgver}/g" "${srcdir}/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
