# Maintainer: Tuan Anh Tran <me@tuananh.org>
_pkgbase=ramalama
pkgname=$_pkgbase-git
pkgver=0.6.2.r0.1e6196
pkgrel=0
pkgdesc="The goal of RamaLama is to make working with AI boring."
arch=('any')
url="https://github.com/containers/ramalama"
license=('MIT')
depends=('python-argcomplete')
makedepends=('python-setuptools' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$_pkgbase"
  python setup.py build
}

package() {
  cd "$_pkgbase"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
