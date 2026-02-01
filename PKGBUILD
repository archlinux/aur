# Maintainer: Natal Bumann wgtray@rcklt.ch
pkgname=wgtray
pkgver=1.2.0
pkgrel=1
pkgdesc="WireGuard system tray client for easy VPN switching"
arch=('any')
url="https://github.com/0xNatal/wgtray"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-pyqt6'
    'python-pyroute2'
    'wireguard-tools'
    'polkit'
    'qt6-svg'
)
install=wgtray.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dc37e4c552e72088785631775a734233f25c41ba51c61fbd4d489a44823bcc59')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
