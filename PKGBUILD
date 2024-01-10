# Maintainer: Francesco Zardi <frazar0 [at] hotmail .dot. it>

_pkgname=lxml-stubs
pkgname=python-$_pkgname
pkgver=0.5.1
pkgrel=1
pkgdesc='Type stubs for the lxml package '
arch=('any')
url="https://github.com/lxml/$_pkgname"
license=('APACHE')
depends=()
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/${_pkgname:0:4}/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('939ee4dd817cd83efe8b35aed1984f79aae25d05756296b348b3f97e1215cc5fa529074b1477b5dd52da6d476f3866c7c37feeb7ee4d63a574dd695e913d2741')

build() {
  cd $_pkgname-$pkgver

  python -m build -nw
}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl
}
