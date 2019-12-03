# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz [at] gmail [dot] com>

pkgname=bootstrap
pkgver=4.4.1
pkgrel=1
pkgdesc='Open source toolkit for developing with HTML, CSS, and JS'
arch=('any')
url='https://getbootstrap.com/'
license=('MIT')
depends=('jquery')
install=bootstrap.install
source=("https://github.com/twbs/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-dist.zip"
	"LICENSE")
sha256sums=('bffa7c741abd4a8558c0946138729f7dcb643491547a0b135fdb77e148b9bfbd'
            'eaf003ef9d4321de625381657eaa69e0093fa6ab00c0201e3fd4847dd9878461')

package() {
  cd ${pkgname}-${pkgver}-dist
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ./{css,js} ${pkgdir}/usr/share/javascript/${pkgname}/
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}
