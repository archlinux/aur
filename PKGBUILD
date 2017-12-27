# Maintainer: Daniel Pagan <dpagan at gatech dot edu>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=exterminator
pkgver=0.2.4
pkgrel=1
pkgdesc='A system process killer written in Python and Elementary'
arch=('any')
url='http://jeffhoogland.github.io/Exterminator/'
license=('BSD')
depends=('python-elmextensions-git' 'python-psutil')
source=("https://github.com/JeffHoogland/Exterminator/archive/$pkgver.tar.gz")

sha256sums=('945fc50e4421cc96ce7e66684bc2068a98d15f3e820af52593d8fb81fc647bb3')

package() {
  cd Exterminator-$pkgver

  install -Dm755 exterminator "$pkgdir/usr/bin/exterminator"
  install -Dm644 exterminator.desktop "$pkgdir/usr/share/applications/exterminator.desktop"

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  sed -n 's/<br>//;/<\/hilight>/d;/^Copyright/,/^SOFTWARE/p' exterminator > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
