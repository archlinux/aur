# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=dex-icon-theme
pkgver=20190421
pkgrel=1
pkgdesc="Samsung Galaxy S8 like icon theme for KDE"
url="https://github.com/ishovkun/Dex"
arch=('any')
license=('LGPL3')
depends=('breeze-icons' 'gtk-update-icon-cache')
makedepends=(git)
options=('!strip')
_commit=88dec457bd3abc4e7f685c0f078d53ff0d1ca7f2
source=("$pkgname::git+$url.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
  cd "$pkgname"
  rm ./Dex*/{AUTHORS,LICENSE}
  find -type f -name '* *' -delete
  find -type f -name '.directory' -delete
  find -type d -name 'New Folder' -delete
  install -d "$pkgdir/usr/share/icons"
  mv Dex* "$pkgdir/usr/share/icons/"
}
