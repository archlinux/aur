# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pkgname=mplstereonet
pkgname=python-${_pkgname,,}
pkgver=0.5
pkgrel=1
pkgdesc="Pytest plugin to help with testing figures output from Matplotlib"
arch=('i686' 'x86_64')
url="https://github.com/joferkington/mplstereonet/"
license=('MIT')
depends=('python>=3.3' 'python-matplotlib' 'python-numpy')
makedepends=('python-setuptools')
#source=("https://files.pythonhosted.org/packages/source/p/${_pkgname,,}/${_pkgname,,}-${pkgver}.tar.gz")
source=("https://github.com/joferkington/${_pkgname,,}/archive/v${pkgver}.tar.gz")
sha256sums=('a50b64de4dfab1dba6ac4c8e75d3af15e5aa73a71a0f56bbbee177aa91e27242')

package() {
    cd ${srcdir}/${_pkgname,,}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
