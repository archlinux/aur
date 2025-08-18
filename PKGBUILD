pkgname=kwin-effect-scalefromcursor-git
pkgver=20250104.g8735dfa
pkgrel=1
pkgdesc="KWin effect: Scale from cursor"
arch=('any')
url="https://github.com/kde-yyds/kwin-effect-scalefromcursor"
license=('GPL')
depends=('kwin')
source=("$pkgname::git+https://github.com/kde-yyds/kwin-effect-scalefromcursor.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use commit date and short hash as version
  git log -1 --format="%cd.%h" --date=format:"%Y%m%d" | sed 's/\./.g/'
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/share/kwin/effects"
  cp -r scalefromcursor "$pkgdir/usr/share/kwin/effects/"
}
