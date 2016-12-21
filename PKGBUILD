# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=gc-shrink
pkgver=0.2
pkgrel=3
pkgdesc='Small command line program that removes garbage from gamecube images to created smaller images.'
arch=('i686' 'x86_64')
url=http://www.gotwalls.com
license=('unknown')
depends=()
source=(http://www.gotwalls.com/files/${pkgname}-${pkgver}.zip)
sha256sums=(547e092e306f99c52685a517af992c562b8de766cd02186caecfb7f1b2620cab)

build() {
  cd ${pkgname}-${pkgver}/src
  gcc -o ${pkgname} ${pkgname}.c -DUNIX
}

package() {
  install -Dm755 ${pkgname}-${pkgver}/src/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
