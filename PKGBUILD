# Maintainer: John Jenkins twodopeshaggy@gmail.com
# Contributor: Gustavo Dutra <mechamo@gustavodutra.com>
pkgname=vimperator
license=("MIT")
pkgver=3.14.0
pkgrel=1
pkgdesc="Make firefox look and behave like Vim"
arch=('any')
url="http://vimperator.org/vimperator"
depends=('firefox>=26')
_extensionId="vimperator@mozdev.org"
_fileName=vimperator-$pkgver.xpi
source=(https://github.com/vimperator/vimperator-labs/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.xpi)
md5sums=('796f1744256782c85632a77932bca8f5')
conflicts=('vimperator-hg' 'vimperator-git')

package() {
  cd $srcdir || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/$_extensionId
  install -d $dstdir || return 1
  cp -R * $dstdir || return 1
  rm $dstdir/$_fileName
}
