# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/neomutt/mutt-language-server/blob/main/.github/workflows/main.yml
pkgname=mutt-language-server
pkgver=0.0.10
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
sha256sums=('f2222d07d1826005e167f25d6f175cebd2d9562daddd897c0bb06d793d39234a')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
