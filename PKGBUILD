# Maintainer: Atom Long <atom.long@hotmail.com>

_pyname=ruamel.base
pkgname=python-${_pyname//./-}
pkgver=1.0.0
pkgrel=1
pkgdesc="(future) place for elements common to multiple packages"
arch=('any')
url="https://pypi.org/project/ruamel.base"
license=("MIT")
makedepends=('python-pip' 'python-wheel')
depends=('python')
source=("https://pypi.io/packages/source/r/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha512sums=('a847f0ae8d889bbc593f6d3507b3208c69d3027a73dddc39058e6da7316937234ef0208394e264a07fd3fa970c97713a14db7a62e374433a27625932bb76c44c')

package() {
  cd ${_pyname}-${pkgver}
  LC_CTYPE=en_US.UTF-8 pip install . --root="$pkgdir" --ignore-installed --no-dependencies
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
