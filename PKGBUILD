# Maintainer: Shane Stone <shanewstone at gmail>
# Contributor: Nathan Isom <nathanisom27 at gmail>

pkgname=ttf-font-linux
pkgver=0.9
pkgrel=1
pkgdesc="An icon font providing popular Linux distro logos."
arch=(any)
url="https://github.com/lukas-w/font-linux"
license=('Unilicense')
depends=(fontconfig xorg-font-utils)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lukas-w/font-linux/archive/v$pkgver.tar.gz")
md5sums=('515a4b9820fda6f717108054a4c4caaa')

package() {
  cd font-linux-$pkgver/assets
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  cd ..
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
