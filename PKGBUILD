# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-brickschema
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="A library for working with the Brick ontology for buildings (brickschema.org)"
arch=('x86_64')
url="https://brickschema.org/"
license=('BSD')
groups=()
depends=('python-owlrl' 'python-pyshacl')
makedepends=('python-setuptools')
optdepends=()
provides=('python-brickschema')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
md5sums=('7d2bba2748944a189a82ea92b6c42814')

build() {
	cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
}
