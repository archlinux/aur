# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
pkgname=quickemu
pkgver=4.0
pkgrel=2
pkgdesc="Quickly create and run optimised Windows, macOS and Linux desktop virtual machines."
arch=(any)
url="https://github.com/quickemu-project/quickemu"
license=('MIT')
depends=('qemu' 'coreutils' 'grep' 'jq' 'procps' 'python3' 'cdrtools' 'usbutils' 'util-linux' 'sed' 'spice-gtk' 'swtpm' 'wget' 'xorg-xrandr' 'zsync' 'edk2-ovmf' 'xdg-user-dirs')
optdepends=('quickgui: graphical user interface' 'aria2: faster downloads')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/quickemu-project/quickemu/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('03df6d03d9d31dbecf376264904f5dd9791796869aabb23ee3b9781b8fdecc8b')

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 quickemu "$pkgdir/usr/bin/quickemu"
  install -Dm755 macrecovery "$pkgdir/usr/bin/macrecovery"
  install -Dm755 quickget "$pkgdir/usr/bin/quickget"
}
