# Maintainer: robertfoster
# Contributor: kehon

pkgname=traccar-bin
pkgver=6.15.2 # renovate: datasource=github-tags depName=tananaev/traccar
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

sha256sums=('b94e51cdcd7bc8bd9ef0030b2cd20af2d62d35fc1d7915ce6fc6e2d564c56d5b')
