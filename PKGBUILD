# Maintainer: Square252 <square@0xfc.de>

pkgname='solokeys-udev'
pkgver='20190308'
pkgrel=2
pkgdesc='Official SoloKey udev rules.'
arch=('any')
url='https://github.com/solokeys/solo/tree/master/udev'
license=('Apache' 'MIT')
depends=('udev')
provides=("$pkgname")
conflicts=("$pkgname" "solokeys-udev-git")
sha256sums=('09134a1f4d97f5a1e591194a24595f966edf5d5f0c6ae45e2bef32d710535c6b'
            '0afcd39efc916b370472d15453c668f4ad9634ef92d9e5ede2d8d6a883af5625'
            '85f080994b30d9e8029400269d59e8aa6710299cfcd41e4633ec9153e969561d'
            '23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3'
            '4d10fe5f3aa176b05b229a248866bad70b834c173f1252a814ff4748d8a13837')
source=('70-solokeys-access.rules'
        'solokeys-udev.install'
        'LICENSE'
        'LICENSE-MIT'
        'LICENSE-APACHE')
install='solokeys-udev.install'

package() {
  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm 644 "${srcdir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/70-solokeys-access.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
