# Maintainer: robertfoster
# Contributor: kehon

pkgname=traccar-bin
pkgver=6.14.1 # renovate: datasource=github-tags depName=tananaev/traccar
pkgrel=1
pkgdesc="Open source GPS tracking system"
arch=('i686' 'x86_64')
url="http://www.traccar.org/"
license=('APACHE')
backup=('opt/traccar/conf/traccar.xml')
source=("https://github.com/tananaev/traccar/releases/download/v${pkgver}/${pkgname%%-*}-linux-64-$pkgver.zip")

package() {
  cd "${srcdir}"
  ./traccar.run --noexec --target "${pkgdir}/opt/traccar/"
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  mv "${pkgdir}/opt/traccar/traccar.service" "${pkgdir}/usr/lib/systemd/system/"
  chmod 755 -R "${pkgdir}/opt"
}

sha256sums=('6a9e99aece5589357401c92c301ff0ae39ccb89c448b0b7fdd116f2d9894acd4')
