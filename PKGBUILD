# Maintainer: ovk <mail@okosh.xyz>
pkgname=dotref
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple tool to manage dotfiles"
arch=('any')
url="https://github.com/ovk/dotref"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/d/dotref/dotref-${pkgver}.tar.gz")
sha256sums=('56fdbc4db06b0c8127d09ba4ea346d13366dfe75bd62a80a665ce77bede5a096')

build() {
  cd "dotref-${pkgname}"
  python setup.py build
}

package() {
  cd "dotref-${pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 ${srcdir}/${pkgname}/completions/completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 ${srcdir}/${pkgname}/completions/completion.fish "${pkgdir}/usr/share/fish/completions/${pkgname}.fish"
}
