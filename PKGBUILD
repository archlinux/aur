# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: duffydack <duffydack73 {at] gmail {dot} com>
pkgname=zsh-auto-notify
pkgver=0.10.1
pkgrel=1
pkgdesc="Zsh plugin that sends out a notification when a long running task has completed"
arch=('any')
url="https://github.com/MichaelAquilina/zsh-auto-notify"
license=('GPL-3.0-or-later')
depends=('zsh' 'libnotify')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MichaelAquilina/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0578cde99fe5dcf31d09369ec5928d98b32ac62924dbe81603a76a15958035ef72233afe2323534b9b9291056ba2f43e91eb9d32817f0e8b4b01fe7feb69c514')
changelog=changelog

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
