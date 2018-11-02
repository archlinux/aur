# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-library-path
pkgver=0.2.0
pkgrel=1
pkgdesc="An extension for colcon-core to set an environment variable to find shared libraries at runtime."
arch=(any)
url="https://pypi.org/project/colcon-library-path/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/5e/3d/b9778bdb0150e4202a476f707db740adf7d080010fceeb66235bf9ad4acf/colcon-library-path-$pkgver.tar.gz")
sha256sums=('a7148fe0b2dd7be92a2e9cdd9ead09a1c5febb92d3d1ae241983b232a3302f0a')


package() {
    cd ${srcdir}/colcon-library-path-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 || echo "Not A Problem"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
