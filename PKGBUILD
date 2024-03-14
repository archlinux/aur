# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/neomutt/mutt-language-server/blob/main/.github/workflows/main.yml
pkgname=mutt-language-server
pkgver=0.0.8
pkgrel=1
pkgdesc="mutt/neomutt's language server"
arch=(any)
url=https://github.com/neomutt/mutt-language-server
depends=(python-lsp-tree-sitter python-tree-sitter-muttrc)
optdepends=(
	'python-pypandoc: generate json schema'
	'python-markdown-it-py: generate json schema: generate json schema'''
	'neomutt: generate json schema'
)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('492f244fd0da2b3ae2ab3d3a0fe335e0902db710d026ba36e295b863c0188cd3')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
