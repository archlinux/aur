# Maintainer: ovk <mail@okosh.xyz>
pkgname=dotref
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple tool to manage dotfiles"
arch=('any')
url="https://github.com/ovk/dotref"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/d/dotref/dotref-${pkgver}.tar.gz")
sha256sums=('d1d9a82c4210d60dc68b84a2f5188def60770c898fbe2a5e8189dfa97052ae1b')

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 ${srcdir}/${pkgname}/completions/completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 ${srcdir}/${pkgname}/completions/completion.fish "${pkgdir}/usr/share/fish/completions/${pkgname}.fish"
}
