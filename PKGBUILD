# Maintainer: Repentinus <aur at repentinus dot eu>

# The authors hereby explictly waive all copyright and related or neighbouring
# rights to this work using the CC0
# <https://creativecommons.org/publicdomain/zero/1.0/>.

pkgname='alacritty-colorscheme'
pkgver=1.0.1
pkgrel=1
pkgdesc="Change colorscheme of alacritty with ease"
arch=('any')
url="https://github.com/toggle-corp/alacritty-colorscheme/"
license=('Apache')
depends=('python-ruamel-yaml' 'python-typed-argument-parser' 'python-pynvim')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('779fa9b7c2352050ca50758c74493a7599ede8a584a089ad9fc7bbc0d9b51c53')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
