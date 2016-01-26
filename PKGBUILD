# Maintainer: Shalygin Konstantin (k0ste@cn.ru)

pkgname='ivideon-client'
pkgver='6.2.0'
pkgrel='285'
pkgdesc='Ivideon Client'
arch=('x86_64')
url=('http://ivideon.com/')
license=('freeware')
depends=('qt5-base' 'qt5-script' 'qt5-svg' 'qt5-multimedia' 'openssl' 'wget' 'vlc')
makedepends=('libarchive')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/${pkgname}/${pkgname}_${pkgver}.${pkgrel}_amd64.deb"
	"${pkgname}.desktop")
sha256sums=('93b0652fe065c8537145e828dee546ed7caa5ae16fbd46dc3693f580d88c0d90'
            '2baf7178b17057d0e638d19c1c3feb17e8eb65ea32106d477f9d53e24937020b')
install='ivideon.install'

build() {
  cd "${srcdir}"
  bsdtar xf "data.tar.gz"
}

package() {
  cp -ax "usr" "${pkgdir}"
  cp -ax "opt" "${pkgdir}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
