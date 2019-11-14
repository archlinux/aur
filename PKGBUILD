# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-nautilus-icons-common')
_pypi_name=('git_nautilus_icons_common')
pkgver=1.1.1
pkgrel=2
arch=('x86_64' 'i686')
url="https://github.com/chrisjbillington/git_nautilus_icons"
license=('BSD 2-Clause "Simplified"')
pkgdesc="Common files for the git-{nautilus,nemo}-icons packages"
depends=('python-gobject')
makedepends=('python-setuptools')
provides=('git-nautilus-icons-common')
conflicts=('git-nautilus-icons-common' 'git-nautilus-icons-common-py2')
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha512sums=('544de9432bea7e48973242d17b8d845f8928796bf5250e4b78fc5fb2ec396663874611093e3276cbe43c48618d63f116e750139fe61ae3ab8ebb81c10087e155')

build() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
