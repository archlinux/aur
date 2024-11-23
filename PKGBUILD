# Maintainer: Sean Ho <holishing@ccns.ncku.edu.tw>
_pkgname=mplstereonet
pkgname=python-${_pkgname,,}
pkgver=0.6.3
pkgrel=1
pkgdesc="Pytest plugin to help with testing figures output from Matplotlib"
arch=('x86_64')
url="https://github.com/joferkington/mplstereonet"
license=('MIT')
depends=('python>=3.3' 'python-matplotlib' 'python-numpy')
makedepends=('python-setuptools')
#source=("https://files.pythonhosted.org/packages/source/p/${_pkgname,,}/${_pkgname,,}-${pkgver}.tar.gz")
source=("https://github.com/joferkington/${_pkgname,,}/archive/v${pkgver}.tar.gz")
sha256sums=('8483c603640f808336ae43043957d10c9e6518462127c906c34929d52b1a435b')

package() {
    cd ${srcdir}/${_pkgname,,}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
