# Maintainer: ovk <mail@okosh.xyz>
pkgname=dotref
pkgver=1.2.4
pkgrel=1
pkgdesc="Simple tool to manage dotfiles"
arch=('any')
url="https://github.com/ovk/dotref"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/d/dotref/dotref-${pkgver}.tar.gz")
sha256sums=('8a6ee15be1f3514c6c520c621b475501b78c87a387cd13bf8a24e5c3dea23c2f')

build() {
  cd "dotref-${pkgver}"
  python setup.py build
}

package() {
  cd "dotref-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 completions/completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 completions/completion.fish "${pkgdir}/usr/share/fish/completions/${pkgname}.fish"
}
