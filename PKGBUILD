# Maintainer: ovk <mail@okosh.xyz>
pkgname=dotref
pkgver=1.2.3
pkgrel=1
pkgdesc="Simple tool to manage dotfiles"
arch=('any')
url="https://github.com/ovk/dotref"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/d/dotref/dotref-${pkgver}.tar.gz")
sha256sums=('18ddca5414230e119cb6ab3f034771c3c01ec45eb0db5cf29e0fa4ed1d4d53bf')

build() {
  cd "dotref-${pkgver}"
  python setup.py build
}

package() {
  cd "dotref-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/completions/${pkgname}.fish"
}
