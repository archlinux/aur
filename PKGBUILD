# Maintainer: Mark Snidal <mark.snidal@gmail.com>
pkgname=attercop
pkgver=0.3.4
pkgrel=1
pkgdesc="Command generations in the shell with natural language"
arch=('any')
url="https://github.com/msnidal/$pkgname"
license=('GPL3')
depends=('python>=3.7.1' 'python-openai>=0.23.1' 'python-pyperclip>=1.8.2' 'python-colorama>=0.4.6')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('44de6f87309470fa65b015247d5bd866')
 
build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}
 
package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
