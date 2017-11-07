# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=kube-shell
_pkgname=kube_shell
pkgver=0.0.21
pkgrel=2
license=('Apache')
pkgdesc='An integrated shell for working with the Kubernetes CLI'
makedepends=('python-pip')
depends=('python' 'python-prompt_toolkit' 'python-pygments' 'python-click' 'python-fuzzyfinder' 'python-kubernetes')
arch=('any')
url='https://github.com/cloudnativelabs/kube-shell'
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-py2.py3-none-any.whl")
sha256sums=('afae1b7f91ca9a80bea0da02ce0075367103f8294ed0cc0cb33489e0dac5441a')
provides=('kube-shell')

package() {
  cd "$srcdir"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
