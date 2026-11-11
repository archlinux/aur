# Maintainer: Goldbro233 <bowensun_06@outlook.com>

pkgname=wlan-auto-login-bin
pkgver=0.1.1
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
sha256sums=('fc73c6297b59c7bf105e6ae59a2ed3038d6328d2f98852d3821f51c281cc676c')

package() {
    install -Dm755 wlanlogin "$pkgdir/usr/bin/wlanlogin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
