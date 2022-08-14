# Maintainer: ovk <mail@okosh.xyz>
pkgname=dotref
pkgver=1.2.2
pkgrel=1
pkgdesc="Simple tool to manage dotfiles"
arch=('any')
url="https://github.com/ovk/dotref"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/d/dotref/dotref-${pkgver}.tar.gz")
sha256sums=('7055c74fe43a30244a50a43f65d9a1c46916c912ab624ee9657c76e19c51206e')

build() {
  cd "dotref-${pkgver}"
  python setup.py build
}

package() {
  cd "dotref-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 ${srcdir}/${pkgname}/completions/completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 ${srcdir}/${pkgname}/completions/completion.fish "${pkgdir}/usr/share/fish/completions/${pkgname}.fish"
}
