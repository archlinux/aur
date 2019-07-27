# Maintainer: duffydack <duffydack73 {at] gmail {dot} com>
pkgname=zsh-auto-notify
pkgver=0.4.0
pkgrel=1
pkgdesc="Zsh plugin that sends out a notification when a long running task has completed"
arch=('any')
url="https://github.com/MichaelAquilina/zsh-auto-notify"
license=('GPL')
depends=('zsh')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MichaelAquilina/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('1faedd7bf04d72804f4dbf745aa2ca873fe39448221f5fe21fa31c8f8311ca3651af2e465c34e45e77ff148f67bdb59083816ed075a4db9a27ec7184047126c4')

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
