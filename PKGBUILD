# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=exterminator
pkgver=0.2.3
pkgrel=1
pkgdesc='A system process killer written in Python and Elementary'
arch=('any')
url='http://jeffhoogland.github.io/Exterminator/'
license=('BSD')
depends=('python-elmextensions' 'python-psutil')
source=("https://github.com/JeffHoogland/Exterminator/archive/$pkgver.tar.gz")
sha256sums=('8acf7c5c6e8161ecfed4644b05caa12ec8daeb5949fd7ec55e6ebb109c6ba626')

package() {
  cd "$srcdir/Exterminator-$pkgver"

  install -Dm755 exterminator "$pkgdir/usr/bin/exterminator"
  install -Dm644 exterminator.desktop "$pkgdir/usr/share/applications/exterminator.desktop"

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  sed -n 's/<br>//;/<\/hilight>/d;/^Copyright/,/^SOFTWARE/p' exterminator > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
