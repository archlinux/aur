# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fawkes-git
pkgver=r74.g3775bba
pkgrel=2
pkgdesc="Image cloaking tool for personal privacy"
arch=('any')
url="http://sandlab.cs.uchicago.edu/fawkes/"
license=('BSD')
depends=('python' 'python-bleach' 'python-keras' 'python-numpy' 'python-pillow' 'python-scikit-image' 'python-tensorflow')
makedepends=('git' 'python-setuptools')
provides=('fawkes')
conflicts=('fawkes')
source=("git+https://github.com/Shawn-Shan/fawkes.git")
sha256sums=('SKIP')


pkgver() {
  cd "fawkes"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

package() {
  cd "fawkes"

  python "setup.py" install \
    --optimize 1 \
    --root "$pkgdir"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/fawkes"
}
