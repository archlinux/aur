# Maintainer: Goldbro233 <bowensun_06@outlook.com>

pkgname=wlan-auto-login-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='CLI and TUI for automatic Student_CX campus Wi-Fi login (prebuilt binary)'
arch=('x86_64')
url='https://github.com/SEUCXCS/wlan-auto-login'
license=('MIT')
depends=('dbus' 'glibc' 'libgcc' 'networkmanager' 'systemd')
optdepends=('gnome-keyring: Secret Service backend for user credentials'
            'kwallet: alternative Secret Service backend for user credentials')
provides=('wlanlogin')
conflicts=('wlanlogin')
options=('!debug')
install=wlan-auto-login-bin.install
source=("$pkgname-$pkgver-$CARCH.tar.gz::$url/releases/download/v$pkgver/wlanlogin-linux-$CARCH.tar.gz")
sha256sums=('46fccfdd7d40a33a4e80fba8d6a0916e2cc44a437a4d018c1a738fab3c109b59')

package() {
    install -Dm755 wlanlogin "$pkgdir/usr/bin/wlanlogin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
