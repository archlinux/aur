# Maintainer: Herbert Knapp <herbert.knapp@edu.uni-graz.at>
pkgname=youtube-dl-nightly-bin
pkgver=0000.00.00
pkgrel=1
pkgdesc="small youtube-dl binary"
arch=(x86_64)
url="https://youtube-dl.org/"
license=('GPL')
conflicts=('youtube-dl')
provides=('youtube-dl')
depends=('python')
makedepends=('curl')
source=('https://youtube-dl.org/downloads/latest/youtube-dl')
md5sums=('SKIP')

pkgver() {
  curl -s -I https://youtube-dl.org/downloads/latest/youtube-dl | sed -n 's,^Location: https://youtube-dl.org/downloads/\([0-9]\{4\}\.[0-9][0-9]\.[0-9][0-9]\)/youtube-dl.*,\1,p'
}

package() {
  install -Dm755 youtube-dl "${pkgdir}/usr/bin/youtube-dl"
}

