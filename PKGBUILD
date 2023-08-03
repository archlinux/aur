# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=plymouth-updates-splash
_reponame=plymouth-arch-updates
pkgver=1.0.0
pkgrel=1
pkgdesc='Graphical alerting of system updates, useful for HTPC usecases.'
arch=('any')
license=('GPL')
depends=('plymouth')
url='https://github.com/emansom/plymouth-arch-updates'
source=("https://github.com/emansom/plymouth-arch-updates/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('da7c07617ef9894578b412566b463f6f61200363768e999ae534ceac9ebdb04f')
b2sums=('8ca71da1cdfd47197cac669817f4b5ff8a879ba69124ad1c23868f427b6fa64890df476057e153831d21aa9135446af15acb2e09537d3b557b0608c7344b8ca0')

package() {
  cd "${_reponame}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/lib/plymouth"
  install -m755 -t "${pkgdir}/usr/lib/plymouth" plymouth-system-update-splash

  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 -t "${pkgdir}/usr/lib/systemd/system" plymouth-system-update-show-splash.service
}
