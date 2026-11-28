# Maintainer: Goldbro233 <bowensun_06@outlook.com>

pkgname=wlan-auto-login-bin
pkgver=2.1.0
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
sha256sums=('fef5015a239fdbf1fecc0e535872de465646f5e13b46feaf4335df6c2db497da')

package() {
    install -Dm755 wlanlogin "$pkgdir/usr/bin/wlanlogin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
