# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=otf-lotion-git
_pkgname=lotion-dist
pkgver=r4.0e5443d
pkgrel=1
pkgdesc="A free monospace font for programming!"
arch=('any')
url="https://font.nina.coffee/"
license=('custom')
provides=('otf-lotion')
source=(git+https://gitlab.com/nefertiti/$_pkgname.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lotion/LICENSE"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 Lotion-Regular.otf "$pkgdir/usr/share/fonts/OTF"
}
