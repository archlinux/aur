pkgname=kwin-effect-foldingpopups-git
pkgver=20250104.g7716980
pkgrel=1
pkgdesc="KWin effect: Folding popups"
arch=('any')
url="https://github.com/kde-yyds/kwin-effect-foldingpopups"
license=('GPL')
depends=('kwin')
source=("$pkgname::git+https://github.com/kde-yyds/kwin-effect-foldingpopups.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use commit date and short hash as version
  git log -1 --format="%cd.%h" --date=format:"%Y%m%d" | sed 's/\./.g/'
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/share/kwin/effects"
  cp -r foldingpopups "$pkgdir/usr/share/kwin/effects/"
}
