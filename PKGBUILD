pkgname=('python-openchemistrypy-git')
_srcname='openchemistrypy'
pkgdesc='OpenChemistry python libraries.'
pkgver=0.0.22
pkgrel=1
arch=('any')
url="https://github.com/OpenChemistry/${_srcname}"
license=('BSD 3-Clause')

depends=('python' 'avogadro2-git')
makedepends=('git' 'python-setuptools')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')

package() {
    cd "${srcdir}/${_srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
