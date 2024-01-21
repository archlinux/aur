# Maintainer: tijko <konick781@gmail.com> 

pkgname=emptty-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Dead simple CLI Display Manager on TTY"
arch=('x86_64')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('pam' 'libx11')
makedepends=('go' 'git')
optdepends=('xorg-server: default display server'
            'xorg-xauth: required if using xorg-server'
            'util-linux: mcookie required if using xorg-server'
            'wayland: alternative to xorg-server')
backup=('etc/emptty/conf')
provides=('emptty')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('05ca5968742e139dd1e4579b9863ba69cf958d3a7a4ae85429b30be4464635a24130d43016c63eb62f444218ebad1a1dbbe6c63379c174dd8a290d79c5102b1a')

package() {
  install -Dm 755 "usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}