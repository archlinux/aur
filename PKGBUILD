# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=python-fake-bpy-module-2.93
_name=${pkgname#python-}
pkgver=20210701
pkgrel=1
pkgdesc="Fake Blender Python API module collection for the code completion."
arch=('any')
url="https://github.com/nutti/fake-bpy-module"
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
	LICENSE::https://raw.githubusercontent.com/nutti/fake-bpy-module/master/LICENSE
)
noextract=()
sha256sums=('20c372c63424ace23422ae9117ab45cfdb3c3f1a8a6550d50926cb3ca3eef999'
            '3baa5ad6fd5710d82e14350234fa124541c5c24b930bf50cde7ee1d2337c2e8e')

build() {
	cd "$_name-$pkgver"

	python setup.py build
}

package() {
	cd "$_name-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
