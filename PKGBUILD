# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=python-naya
_name=${pkgname#python-}
pkgver=1.1.1
pkgrel=1
pkgdesc="A fast streaming JSON parser written in Python."
arch=('any')
url="https://github.com/danielyule/naya"
license=('MIT')
groups=()
depends=("python")
makedepends=("python-setuptools")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	https://raw.githubusercontent.com/danielyule/naya/master/LICENSE
)
noextract=()
sha256sums=(
	'98076896982955a5129ab649d9cba2b1a5d3f4c4ccb2bc53c4168c0aea4c34f9'
	'7b40115cc151409f3e53c6d0adf1ae89159e5185f6453761e258b506761b64fb'
)

build() {
	cd "$_name-$pkgver"

	python setup.py build
}

package() {
	cd "$_name-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
