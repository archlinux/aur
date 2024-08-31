# Contributor: chocolatemelt <hello@zhangkev.in>

pkgname=bdf-baekmuk-git
_gitname=baekmuk
pkgver=0.7.4020ae7
pkgrel=3
pkgdesc='free hangul bitmap fonts for X11'
arch=('any')
url="https://github.com/chocolatemelt/baekmuk"
depends=('xorg-fonts-encodings' 'xorg-bdftopcf')
makedepends=('git' 'make')
install="$pkgname.install"
source=('git+https://github.com/chocolatemelt/baekmuk.git')
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
