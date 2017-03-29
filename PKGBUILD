# Maintainer: chocolatemelt <hello@zhangkev.in>

pkgname=bdf-naga10-git
_gitname=naga10
pkgver=0.11.b0daebf
pkgrel=2
pkgdesc='free japanese bitmap font for X11'
arch=('any')
url="https://github.com/chocolatemelt/baekmuk"
depends=('xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('git' 'make')
install="$pkgname.install"
source=('git+https://github.com/chocolatemelt/naga10.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
  cd "$_gitname"
  make all
  install -d -m755 "$pkgdir/usr/share/fonts/misc/"
  install -m644 -t "$pkgdir/usr/share/fonts/misc/" out/*.pcf.gz
}
