# Maintainer: Repentinus <aur at repentinus dot eu>

# It is the authors' firm belief this file lacks sufficient originality to
# qualify for copyright protection. In the event they are wrong, the authors
# hereby explictly waive all copyright and related or neighbouring rights to this
# work using the CC0 <https://creativecommons.org/publicdomain/zero/1.0/>.

pkgname='alacritty-colorscheme'
pkgver=0.2.1
pkgrel=1
pkgdesc="Change colorscheme of alacritty with ease"
arch=('any')
url="https://github.com/toggle-corp/alacritty-colorscheme/"
license=('Apache')
depends=('python-ruamel-yaml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('9d21531c19ad2c04decb70383b89048123ca578db2ce6048bad5d1e03109c8b3')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
