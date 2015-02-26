# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=exterminator
pkgver=0.2.1
pkgrel=1
pkgdesc='A system process killer written in Python and Elementary'
arch=('any')
url='http://jeffhoogland.github.io/Exterminator/'
license=('BSD')
depends=('python-elmextensions' 'python-psutil')
source=("https://github.com/JeffHoogland/Exterminator/archive/$pkgver.tar.gz")
sha256sums=('bfe9994ad26fa4c9990ea84a565a5502e0e4c85c563583040edfa44500a928dc')

package() {
  cd "$srcdir/Exterminator-$pkgver"

  install -Dm755 exterminator "$pkgdir/usr/bin/exterminator"
  install -Dm644 exterminator.desktop "$pkgdir/usr/share/applications/exterminator.desktop"

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  sed -n 's/<br>//;/<\/hilight>/d;/^Copyright/,/^SOFTWARE/p' exterminator > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}