# : Autor Alesey Korop <akorop@gmail.com>

pkgname=scrdclock
pkgver=1.00
pkgrel=1
pkgdesc="Simple semi-transparent mouse-through screenlet that show date/time."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/scrdclock/files/"
license=('GPL3')
depends=('glibc')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgver}/${pkgname}-${pkgver}.tgz)
sha1sums=('dbf877806691c54f32839c7c4ae7415d89b5965e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  gcc -lXext -lX11 -pthread  ${pkgname}.c -o ${pkgname}
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
