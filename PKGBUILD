# Maintainer: Victor Engmark <victor.engmark@gmail.com>
pkgname=python-vcard
_name="${pkgname#*-}"
pkgver=0.10.2
pkgrel=1
pkgdesc="vCard validator"
arch=('any')
url='https://github.com/l0b0/vcard'
license=('GPL3')
depends=('python' 'python-isodate')
makedepends=('python')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('7fdcdccbe6c27f059c79169b652a84265741d96b1f242929b2406462f0bbd8ab3d071653fcb0ca4b29ea5a8d2763a8c4b89f23b22fbcb0537e5281f4621f380e')

package() {
	cd "$srcdir/${_name}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1
}
