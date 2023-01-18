# Contributor: quellen <lodgerz@gmail.com>
pkgname=amitools
pkgver=0.7.0
pkgrel=1
pkgdesc="Various tools for using AmigaOS programs on other platforms"
arch=('i686' 'x86_64')
url="https://github.com/cnvogelg/amitools"
license=('GPL')
depends=()
makedepends=('python-setuptools')
provides=('amitools')
conflicts=(${provides[@]})

source=(
  "${pkgname}-${pkgver}.tar.gz"::"$url/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  'b8fafbbaae09346602efdeb88e4b7cea83c6ee148b896d00f0737fad7188aa9d'
)

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() {
  depends=('python')

  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --prefix=/usr
} 
