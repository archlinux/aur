# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-nautilus-icons-common-py2')
_pypi_name=('git_nautilus_icons_common')
pkgver=1.1.3
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/chrisjbillington/git_nautilus_icons"
license=('BSD 2-Clause "Simplified"')
pkgdesc="Common files for the git-{nautilus,caja}-icons-py2 packages"
depends=('python2-gobject' 'python2-pathlib' 'python2-enum34')
makedepends=('python2-setuptools')
provides=('git-nautilus-icons-common-py2')
conflicts=('git-nautilus-icons-common' 'git-nautilus-icons-common-py2')
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha512sums=('4971b74ad5e490e3348bf76399e049e93cb9f0ce584f541df1341802442844ff498aaab4577081b533ea7b36ec775116b767893fadb944026fca11a8f57161ef')

build() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
