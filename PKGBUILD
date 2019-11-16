# Maintainer: Shane Stone <shanewstone at gmail>

pkgname=ttf-font-logos
pkgver=0.12
pkgrel=1
pkgdesc="An icon font providing popular Linux distro logos."
arch=(any)
replaces=('ttf-font-linux')
url="https://github.com/lukas-w/font-logos"
license=('Unilicense')
depends=(fontconfig xorg-font-utils)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lukas-w/font-logos/archive/v$pkgver.tar.gz")
md5sums=('4b9c868c059db7d568c997f4413a530b')

package() {
  cd font-logos-$pkgver/assets
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  cd ..
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
