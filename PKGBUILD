_pkgname=vim_bridge
pkgname=vim_bridge-git
pkgver=20101206
pkgrel=1
pkgdesc="A Python-to-Vim bridge decorator to call Python functions in Vim scripts."
url="https://github.com/nvie/vim_bridge"
depends=('python2' 'vim')
license=('BSD')
arch=('any')
source=("git+https://github.com/nvie/vim_bridge.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
