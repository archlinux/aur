# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-fake-bpy-module-latest
_name=${pkgname#python-}
pkgver=20240101
pkgrel=1
pkgdesc="Collection of the fake Blender Python API module for the code completion."
arch=('x86_64')
url="https://github.com/nutti/fake-bpy-module"
license=('MIT')
groups=()
depends=()
makedepends=('python-setuptools')
optdepends=()
provides=('python-fake-bpy-module-latest')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz LICENSE)
noextract=()
md5sums=('1f31dabfb4ce42d01ee1ff08856bec6b'
         '32ba1ec9dcc25969e1de127a63005836')

build() {
	cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
}
