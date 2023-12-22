# Maintainer: not_anonymous <nmlibertarian@gmail.com>
## Newly re-written/patched/et al from scratch - 2017
## Prior to 2017 contributors:
# Contributor: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Contributor: Ward De Ridder <aur[at]warddr.eu>

pkgname=kochmorse-py
_pkgname=KochMorse
pkgver=2.0.0
pkgrel=2
pkgdesc="Morse Code (Ham Radio) trainer using the Koch-method. - PYTHON version"
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('GPL')
depends=('python3' 'gtk3' 'python-pyalsaaudio' 'python-gobject' 'gobject-introspection-runtime')
optdepends=('hamradio-menus: XDG compliant menuing')
provides=('kochmorse')
conflicts=('kochmorse' 'kochmorse-git')
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz
	diff.kochmorse)

prepare() {
	cd $srcdir/${_pkgname}-$pkgver

	patch -p0 < ../diff.kochmorse
}

package() {
	cd $srcdir/${_pkgname}-$pkgver

	python setup.py install --root=$pkgdir --optimize=1
}
md5sums=('42b393dbc389d09c32d44de6c9a89596'
         '5048854319234a166242a62ad85b57dd')
sha256sums=('405893c3b322434724f98c16cfa1e9f1bbe7e1391c48d2934b57a8df341135fa'
            'd2a7154c8c0f7204a5e100257f3ad8fcb6ee32e66ee34dbf01f105a0e1db52d1')
