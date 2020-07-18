# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=ttf-font-logos
pkgver=0.14
pkgrel=1
pkgdesc="An icon font providing popular Linux distro logos."
arch=(any)
replaces=('ttf-font-linux')
url="https://github.com/lukas-w/font-logos"
license=('Unilicense')
depends=(fontconfig)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lukas-w/font-logos/archive/v$pkgver.tar.gz")
md5sums=('cad23ff0941c2a55a9cec14793a42ac5')

package() {
  cd font-logos-$pkgver/assets
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  cd ..
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
