# Maintainer: Shatur95 <genaloner@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=bibata-cursor-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="Material Based Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL3')
makedepends=('python-clickgen' 'yarn' 'npm')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5e694dafa6d0a338bb744d43d09b0d31fc55f105b3659754ea226d170b590999')

build() {
  cd "$srcdir/Bibata_Cursor-$pkgver"
  yarn install --cache-folder "$srcdir/yarn-cache"
  yarn render:bibata-modern
  yarn render:bibata-original
  yarn build
}

package() {
  cd "$srcdir/Bibata_Cursor-$pkgver"
  install -d "$pkgdir/usr/share/icons"
  cp -r themes/Bibata-* "$pkgdir/usr/share/icons"
  chmod -R 755 "$pkgdir"/usr/share/icons/Bibata-*
}
