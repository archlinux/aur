# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname='responsively-app'
_upkgname='ResponsivelyApp'
pkgname=responsively-bin
pkgver=0.19.1
pkgrel=1
pkgdesc="A modified web browser that helps in responsive web development. A web developer's must have dev-tool"
arch=('x86_64')
url='https://responsively.app'
license=('AGPL3')
provides=('responsively')
depends=('alsa-lib' 'gtk3' 'nss' 'libxss')
options=('!strip')
source=("${pkgname}-${pkgver}.rpm::https://github.com/responsively-org/responsively-app/releases/download/v${pkgver}/Responsively-App-${pkgver}.x86_64.rpm")
sha256sums=('1aea05b3e695b64ff120dd603092fdcb937317b2d9e9039fb2563b8b975f30dc')

package() {
  install -dv "${pkgdir}/usr/bin"
  cp -r "${srcdir}/opt/" "${pkgdir}"
  cp -r "${srcdir}/usr/" -t "${pkgdir}"
  ln -sfv "/opt/ResponsivelyApp/responsively-app" -t "${pkgdir}/usr/bin"
}

