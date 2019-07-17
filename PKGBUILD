# Maintainer: duffydack <duffydack73 {at] gmail {dot} com>
pkgname=zsh-auto-notify
pkgver=0.2.0
pkgrel=1
pkgdesc="Zsh plugin that sends out a notification when a long running task has completed"
arch=('any')
url="https://github.com/MichaelAquilina/zsh-auto-notify"
license=('GPL')
depends=('zsh')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MichaelAquilina/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e790029e8175a1426ae374c635b40296917db55e71e3d5408a18c02cd1a2d8002a979494feaa3651d9488948a13ee13a3feab4cfe09f67a802408f0134c1550c')

package() {
  cd "$pkgname-$pkgver"
  install -vDm 644 auto-notify.plugin.zsh \
    -t "${pkgdir}/usr/share/zsh/plugins/${pkgname}/"
  # docs
  install -vDm 644 README.rst \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
