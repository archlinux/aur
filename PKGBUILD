# Maintainer: Tira Misu <misu dot tira at cock dot li>
pkgname=zsh-auto-dunstify
pkgver=0.1.0
pkgrel=4
pkgdesc="Zsh plugin that sends out a dunst notification when a long running task has completed"
arch=('any')
url="https://github.com/Amir1453/zsh-auto-dunstify"
license=('GPL-3.0-or-later')
depends=('zsh' 'dunst')
conflicts=('zsh-auto-notify')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Amir1453/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('SKIP')
changelog=changelog

package() {
  cd "$pkgname-$pkgver"
  install -vDm 644 auto-dunstify.plugin.zsh \
    -t "${pkgdir}/usr/share/zsh/plugins/${pkgname}/"
  # docs
  install -vDm 644 README.rst \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
