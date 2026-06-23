# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ivideon-client'
pkgver='6.20.0'
pkgrel='2076'
pkgdesc='Ivideon Client'
arch=('x86_64')
url='https://ivideon.com'
license=('freeware')
depends=('qt5-base' 'openssl' 'qt5-multimedia' 'qt5-websockets')
makedepends=('libarchive')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/${pkgname}/${pkgname}_${pkgver}.${pkgrel}_amd64.deb"
	"${pkgname}.desktop")
sha256sums=('a7ef76427f5dc6aba95b56599a6653d0c033e34e375ddccb1341f77c5f623487'
            '2baf7178b17057d0e638d19c1c3feb17e8eb65ea32106d477f9d53e24937020b')
install='ivideon.install'

build() {
  bsdtar xf "data.tar.zst"
}

package() {
  cp -ax "usr" "${pkgdir}"
  cp -ax "opt" "${pkgdir}"
  install -Dm0644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
