# Maintainer: Erazem Kokot <contact at erazem dot eu>

pkgname='hblock'
pkgver=2.0.5
pkgrel=5
pkgdesc='An adblocker that creates a hosts file from automatically downloaded blacklists'
arch=('any')
url='https://github.com/hectorm/hblock'
license=('MIT')
depends=('bash')
sha256sums=('2de6856a863e1901d03f6566ed7b425778e65484b7f62c2ebe7c2b2f6fd23363')
source=("https://github.com/hectorm/${pkgname}/archive/v${pkgver}.tar.gz")

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 0755 hblock "${pkgdir}/usr/bin/hblock"
  install -Dm 0644 resources/systemd/hblock.service "${pkgdir}/usr/lib/systemd/system/hblock.service"
  install -Dm 0644 resources/systemd/hblock.timer "${pkgdir}/usr/lib/systemd/system/hblock.timer" 
  install -Dm 0644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  #make DESTDIR="${pkgdir}/" SKIP_SERVICE_START=1 install
}
