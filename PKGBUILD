# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: duffydack <duffydack73 {at] gmail {dot} com>
pkgname=zsh-auto-notify
pkgver=0.11.1
pkgrel=1
pkgdesc="Zsh plugin that sends out a notification when a long running task has completed"
arch=('any')
url="https://github.com/MichaelAquilina/zsh-auto-notify"
license=('GPL-3.0-or-later')
depends=('zsh' 'libnotify')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MichaelAquilina/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('b082b5592d642819cb9db4167ad581e36135ecdb53e9275f7af0aa0a6faa23bb7428d18995389cda988f946cb24e8e6b4b3676d158ae359ee9e7a32379ae7944')
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
