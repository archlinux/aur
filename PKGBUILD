# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
pkgname=quickemu
pkgver=3.15
pkgrel=1
pkgdesc="Quickly create and run optimised Windows, macOS and Linux desktop virtual machines."
arch=(any)
url="https://github.com/quickemu-project/quickemu"
license=('MIT')
depends=('qemu' 'coreutils' 'grep' 'jq' 'procps' 'python3' 'cdrtools' 'usbutils' 'util-linux' 'sed' 'spice-gtk' 'swtpm' 'wget' 'xorg-xrandr' 'zsync' 'edk2-ovmf')
optdepends=('quickgui: graphical user interface' 'aria2: faster downloads')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/quickemu-project/quickemu/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bba9f0432a5fdb65e52356438ccf62367da5704821a95545eeb472d8a3cb9412')

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 quickemu "$pkgdir/usr/bin/quickemu"
  install -Dm755 macrecovery "$pkgdir/usr/bin/macrecovery"
  install -Dm755 quickget "$pkgdir/usr/bin/quickget"
}
