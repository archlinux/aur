# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=('yubikey-manager')
pkgver=0.1.0
pkgrel=2
pkgdesc='Command line and GUI tool for configuring YubiKeys, over all transports.'
arch=('any')
url='https://developers.yubico.com/yubikey-manager/'
license=('BSD')
depends=('python' 'python-pyusb' 'python-pyscard' 'python-pyside' 'python-click' 'libu2f-host' 'yubikey-personalization')
source=("https://developers.yubico.com/yubikey-manager/Releases/yubikey-manager-$pkgver.tar.gz")
sha256sums=('a710b1ba35e88d2651e7ab8a0b93a68dceab4be6be457dd56fb8c84f22674f3d')

package() {
  cd "$srcdir/yubikey-manager-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

