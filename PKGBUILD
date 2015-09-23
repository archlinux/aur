# Maintainer: Shalygin Konstantin (k0ste@cn.ru)

pkgname='ivideon-client'
pkgver='6.1.2'
pkgrel='242'
pkgdesc='Ivideon Client'
arch=('x86_64')
url=('http://ivideon.com/')
license=('freeware')
depends=('qt5-base' 'qt5-script' 'qt5-svg' 'openssl' 'wget' 'vlc')
makedepends=('libarchive')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/${pkgname}/${pkgname}_${pkgver}.${pkgrel}_amd64.deb"
	"${pkgname}.desktop")
sha256sums=("69cc22419e93ce470255aa953a0af92313a8383073a4ce2719afabc8fd6d4a49"
	    "2baf7178b17057d0e638d19c1c3feb17e8eb65ea32106d477f9d53e24937020b")
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