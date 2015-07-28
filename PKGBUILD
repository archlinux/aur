# Maintainer: Kai Yuan <kent.yuan @t gmail d@t com>
pkgname=retmux-git
pkgver=r87.75e1129
pkgrel=1
pkgdesc="tmux sessions backup and restore tool"
arch=('any')
url="https://github.com/sk1418/retmux"
license=('MIT')
makedepends=('git')
depends=('python2' 'tmux' 'python2-setuptools')
sha256sums=('SKIP')
sha512sums=('SKIP')
source="$pkgname::git+http://github.com/sk1418/${pkgname%-*}.git#branch=bleeding"

package() {
  cd ${pkgname}
  find . -name "*.py" |xargs sed -i "s|/usr/bin/python|&2|" 
  python2 setup.py install --root="$pkgdir" --prefix="/usr"
}

pkgver(){
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
