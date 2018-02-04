# Maintainer: sumt <sumt at sci dot fi>

pkgname=python-py3amf-git
pkgver=0.8.7.r0.g06c5ee6
pkgrel=1
pkgdesc="AMF support for Python"
arch=('x86_64')
url="https://github.com/StdCarrot/Py3AMF"
license=('MIT')
depends=('python-defusedxml')
makedepends=('git' 'python-setuptools')
provides=(python-pyamf=$pkgver)
conflicts=(python-pyamf)
source=("$pkgname::git+https://github.com/StdCarrot/Py3AMF.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

