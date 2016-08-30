# Maintainer: Shalygin Konstantin <k0ste@cn.ru>

pkgname='ivideon-client'
pkgver='6.2.2'
pkgrel='421'
pkgdesc='Ivideon Client'
arch=('x86_64')
url='https://ivideon.com'
license=('freeware')
depends=('qt5-base' 'qt5-script' 'qt5-svg' 'qt5-multimedia' 'openssl' 'wget' 'vlc')
makedepends=('libarchive')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/${pkgname}/${pkgname}_${pkgver}.${pkgrel}_amd64.deb"
	"${pkgname}.desktop")
sha256sums=('15d10499ae02d2888b7620dd06f8f4914129897ac8025592dc08ed6408fa99b6'
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
