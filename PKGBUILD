# Maintainer: duffydack <duffydack73 {at] gmail {dot} com>
pkgname=zsh-auto-notify
pkgver=0.3.0
pkgrel=1
pkgdesc="Zsh plugin that sends out a notification when a long running task has completed"
arch=('any')
url="https://github.com/MichaelAquilina/zsh-auto-notify"
license=('GPL')
depends=('zsh')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MichaelAquilina/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('6bbcc437b88edac54dbb66018f490132fd7e34eb4858dfa1c76aa89d2c9d8c7f7938546b8cf3fb8a6f0c44bfb5e58065a20ce01029e1392deac3474202c769e3')

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
