# Maintainer: Kai Yuan <kent.yuan @t gmail d@t com>
pkgname=zhuaxia
pkgver=2.4.0
pkgrel=1
pkgdesc="cli tool to download mp3 from xiami.com and music.163.com"
arch=('any')
url="https://github.com/sk1418/zhuaxia"
license=('MIT')
makedepends=('git')
depends=('python2-requests' 'python2-mutagen' 'python2-beautifulsoup4' 'python2-setuptools')
sha256sums=('SKIP')
sha512sums=('SKIP')
source="$pkgname::git+http://github.com/sk1418/${pkgname%-*}.git"

package() {
  cd ${pkgname}
  find . -name "*.py" |xargs sed -i "s|/usr/bin/python|&2|" 
  python2 setup.py install --root="$pkgdir" --prefix="/usr"
}

# vim:set ts=2 sw=2 et:
