# Maintainer: robertfoster
# Contributor: kehon

pkgname=traccar-bin
pkgver=6.13.3 # renovate: datasource=github-tags depName=tananaev/traccar
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

sha256sums=('8c0bc5a7ac8da3cf635c1d162bfa4db598175a63e7839bf6c0a74264375fc0b6')
