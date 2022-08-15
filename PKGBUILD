# Maintainer: 0WN463 <0WN3D.e4d568 at burnermail dot io> 
# Contributor: 

pkgname=bobcat-git
pkgver=r38.7cb1846
pkgrel=1
pkgdesc="CLI script to browse and solve problems on Kattis, the online judge"
arch=('any')
url="https://github.com/0WN463/bobcat"
license=('MIT')
depends=('python' 'python-requests' 'python-lxml' 'python-beautifulsoup4')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/bobcat"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/bobcat"
  python setup.py install --root="$pkgdir/" #--prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  #install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

