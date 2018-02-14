# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pytest-remotedata
pkgver=0.2.0
pkgrel=1
pkgdesc="Pytest plugin used for controlling access to data files hosted online"
arch=('i686' 'x86_64')
url="https://github.com/astropy/pytest-remotedata"
license=('BSD')
depends=('python' 'python-pytest' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pytest-remotedata/pytest-remotedata-${pkgver}.tar.gz")
md5sums=('963ee4151c16d2dd2679bcd97fc324ff')

package() {
    cd ${srcdir}/pytest-remotedata-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    rm -rf ${pkgdir}/usr/lib/python3.6/site-packages/tests
}
