# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-core
pkgver=0.3.12
pkgrel=2
pkgdesc="Command line tool to build sets of software packages."
arch=(any)
url="https://pypi.org/project/colcon-core"
license=('Apache')
depends=('python-pytest' 'python-pytest-runner' 'python-pytest-rerunfailures' 'python-pytest-repeat' 'python-coverage' 'python-pytest-cov' 'python-distlib' 'python-notify2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/37/dd/ebb44097dd8f9c57bfa17bc202bce9a3a1a5e44a3d911c050002cae0dbf6/colcon-core-$pkgver.tar.gz")
sha256sums=('7cb8e79a4524f474478ab2b8ba1038c57bd42d778e69ecca70cd3f126eda0b79')

package() {
    cd ${srcdir}/colcon-core-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
