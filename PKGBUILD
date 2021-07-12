# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>
# contributor: <a.c.kalker@gmail.com>

pkgname=sound-icons
pkgver=0.1
pkgrel=2
pkgdesc="a collection of Sound Icons for speech-dispatcher"
arch=('any')
url="http://www.freebsoft.org/"
license=('GPL2')
source=("http://www.freebsoft.org/pub/projects/sound-icons/sound-icons-${pkgver}.tar.gz")
sha512sums=('f0ba9e1e84ace325671c7f323f01d647aa0e1a318e9adc2a6d8af4e0d795e478b2ea66007670f9c7ced9ef7310fdbccb5168b0f404579f5dff8712fe12ad93a0')

package() {
  cd "$pkgname-$pkgver"
  install -vDm 644 *.wav -t "${pkgdir}/usr/share/sounds/${pkgname}"
  find . -type l -execdir install -vDm 644 -t "${pkgdir}/usr/share/sounds/${pkgname}" {} +
  install -vDm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}
