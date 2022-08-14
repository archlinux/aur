# Maintainer: ovk <mail@okosh.xyz>
pkgname=dotref
pkgver=1.2.1
pkgrel=1
pkgdesc="Simple tool to manage dotfiles"
arch=('any')
url="https://github.com/ovk/dotref"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/d/dotref/dotref-${pkgver}.tar.gz")
sha256sums=('a02c559581e8dc7b63637ce7f76db49a9fbe99ec1ba27564181c2d496cd6042c')

build() {
  cd "dotref-${pkgver}"
  python setup.py build
}

package() {
  cd "dotref-${pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 ${srcdir}/${pkgname}/completions/completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 ${srcdir}/${pkgname}/completions/completion.fish "${pkgdir}/usr/share/fish/completions/${pkgname}.fish"
}
