# Maintainer: robertfoster
# Contributor: kehon

pkgname=traccar-bin
pkgver=5.5
pkgrel=1
pkgdesc="Open source GPS tracking system"
arch=('i686' 'x86_64')
url="http://www.traccar.org/"
license=('APACHE')
backup=('opt/traccar/conf/traccar.xml')
depends=('java-runtime')
source=("https://github.com/tananaev/traccar/releases/download/v${pkgver}/${pkgname%%-*}-linux-64-$pkgver.zip")

package() {
  cd "${srcdir}"
  ./traccar.run --noexec --target "${pkgdir}/opt/traccar/"
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  mv "${pkgdir}/opt/traccar/traccar.service" "${pkgdir}/usr/lib/systemd/system/"
  chmod 755 -R "${pkgdir}/opt"
}

sha256sums=('ed6fc24c705bd2726889a885979e769bf3676785e33dd0c7800cc11ad74e058f')
