# Contributor: Sapphira Armageddos <shadowkyogre.public+aur <AT> gmail <DOT> com>

pkgname=python-markdown-sections
pkgver=8.82972f5
pkgrel=1
pkgdesc="Python-Markdown extension to provide a small amount of structure to Markdown documents."
arch=('any')
url="http://github.com/jessedhillon/mdx_sections"
license=('GPL2')
depends=('python-markdown')
makedepends=('git' 'python-setuptools')
_commit=82972f5b8c7a94b0b0bf183f73d782fe718f7664
source=("$pkgname"::git+https://github.com/jessedhillon/mdx_sections#commit=${_commit})
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="${pkgdir}"
}
