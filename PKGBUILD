# Maintainer: aksh1618 <aakarshituppal at gmail dot com>
pkgname=kobweb
pkgver=0.9.10
pkgrel=1
pkgdesc='Set up and manage your Compose for Web app'
arch=('any')
url='https://kobweb.varabyte.com/'
license=('APACHE')
depends=('sh'
         'java-runtime>=11')
source=("https://github.com/varabyte/kobweb/releases/download/cli-v${pkgver}/${pkgname}-${pkgver}.tar"
        "${pkgname}")
sha256sums=('88eaab85ea5a5a0589fb402e3fc41d9af2d6a44affe8b2db3232875f028dfa05'
            '9a7574f298111c7f1941f80f5b41745c650267d55e5a76f3e963e53dfdbebc84')

package() {
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/lib/"* -t "$pkgdir/usr/share/java/kobweb/"
  sed -i "s/{pkgver}/${pkgver}/g" "${srcdir}/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
