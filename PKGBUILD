# Maintainer: robertfoster
# Contributor: kehon

pkgname=traccar-bin
pkgver=6.4
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

sha256sums=('c117a7a0f5914d4205bbdd575bdb83042c318331740e9c714352824155135541')
