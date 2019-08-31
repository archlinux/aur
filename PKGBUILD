# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-nemo-icons')
pkgver=1.1.1
pkgrel=0
arch=('x86_64' 'i686')
url="https://github.com/chrisjbillington/git_nautilus_icons"
license=('BSD 2-Clause "Simplified"')
pkgdesc="A Nemo extension to overlay icons on files in git repositories"
depends=('git-nautilus-icons-common' 'nemo-python')
makedepends=('python-setuptools')
provides=('git-nemo-icons')
conflicts=('git-nemo-icons')
source=("https://github.com/chrisjbillington/git_nautilus_icons/archive/${pkgver}.tar.gz")
sha512sums=('c5e439b1a91b183b6fe3d52ddeae796c2339a78cf9378736c6eaee336c27b8691be0052f76bf15e9e3901bce2e7a2f7bd3383fa928f252ad50be9a53c0090c7b')

build() {
    cd "${srcdir}/git_nautilus_icons-${pkgver}/git_nemo_icons"
    python setup.py build
}

package() {
    cd "${srcdir}/git_nautilus_icons-${pkgver}/git_nemo_icons"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}