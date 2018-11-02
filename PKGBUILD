#Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-devtools
pkgver=0.2.1
pkgrel=1
pkgdesc="An extension for colcon-core to provide information about the plugin system."
arch=(any)
url="https://pypi.org/project/colcon-devtools/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/1d/ac/8f67927a04e8c05fb9d7abca0f5954382e92d136e00c9d961a8875b84bd7/colcon-devtools-$pkgver.tar.gz")
sha256sums=('5761e2025e4860ca618491aebd2bd12ab68ebd96c11c92ad1b7e1b1caf7a1ecf')


package() {
    cd ${srcdir}/colcon-devtools-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
