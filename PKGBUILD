# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-python-setup-py
pkgver=0.2.1
pkgrel=1
pkgdesc="An extension for colcon-core to identify packages with a setup.py file by introspecting the arguments to the setup() function call of setuptools."
arch=(any)
url="https://pypi.org/project/colcon-python-setup-py"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/65/97/f0dac66d6afa400e339229398ffd250b7be320261fa32a13db3e41764567/colcon-python-setup-py-$pkgver.tar.gz")
sha256sums=('c9495b26515fc17189045d8a564e0b37a359d797c900f78e83f6ece1377d573b')


package() {
    cd ${srcdir}/colcon-python-setup-py-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
