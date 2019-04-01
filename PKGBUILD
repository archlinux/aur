# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz [at] gmail [dot] com>

pkgname=bootstrap
pkgver=4.3.1
pkgrel=1
pkgdesc='Open source toolkit for developing with HTML, CSS, and JS'
arch=('any')
url='https://getbootstrap.com/'
license=('MIT')
depends=('jquery')
install=bootstrap.install
source=("https://github.com/twbs/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-dist.zip"
	"LICENSE")
sha256sums=('888ffd30b7e192381e2f6a948ca04669fdcc2ccc2ba016de00d38c8e30793323'
            'eaf003ef9d4321de625381657eaa69e0093fa6ab00c0201e3fd4847dd9878461')

package() {
  cd ${pkgname}-${pkgver}-dist
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ./{css,js} ${pkgdir}/usr/share/javascript/${pkgname}/
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}
