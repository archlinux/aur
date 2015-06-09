# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=mega.py-git
pkgver=159.246d943
pkgrel=1
pkgdesc="Python library for the Mega.co.nz API"
arch=(any)
url="https://github.com/richardasaurus/mega.py"
license=(GPL)
depends=(python2 python2-requests python2-crypto)
makedepends=(git)
options=(!emptydirs)
source=('mega.py::git+https://github.com/richardasaurus/mega.py.git')
sha512sums=('SKIP')

pkgver() {
  cd mega.py
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd mega.py
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
