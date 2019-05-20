# Maintainer: Square252 <square@0xfc.de>

pkgname='solokeys-udev'
pkgver='20190308'
pkgrel=2
pkgdesc='Official SoloKey udev rules.'
arch=('any')
url='https://github.com/solokeys/solo/tree/master/udev'
license=('Apache')
depends=('udev')
provides=("$pkgname")
conflicts=("$pkgname" "solokeys-udev-git")
sha256sums=('09134a1f4d97f5a1e591194a24595f966edf5d5f0c6ae45e2bef32d710535c6b'
            '0afcd39efc916b370472d15453c668f4ad9634ef92d9e5ede2d8d6a883af5625')
source=('70-solokeys-access.rules'
        'solokeys-udev.install')
install='solokeys-udev.install'

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/70-solokeys-access.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
