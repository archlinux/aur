# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-core
pkgver=0.3.22
pkgrel=1
pkgdesc="Command line tool to build sets of software packages."
arch=(any)
url="https://pypi.org/project/colcon-core"
license=('Apache')
depends=('python-pytest' 'python-pytest-runner' 'python-pytest-rerunfailures' 'python-pytest-repeat' 'python-coverage' 'python-pytest-cov' 'python-distlib' 'python-notify2')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/70/55/2a1effeac1707632ccb8121f920f4b142fa6e43ce967ce17897e94ce5352/colcon-core-0.3.22.tar.gz)
sha256sums=('b3f04e14168675914e87fde3d0999279499fe61203109419782408c371f58be1')

package() {
    cd ${srcdir}/colcon-core-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
