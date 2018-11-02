#Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-common-extensions
pkgver=0.2.0
pkgrel=1
pkgdesc="A meta package aggregating colcon-core as well as a set of common extensions."
arch=(any)
url="https://pypi.org/project/colcon-common-extensions/"
license=('Apache')
depends=('python-yaml'
         'python-pyaml'
         'python-colcon-core' 
         'python-colcon-ros' 
         'python-colcon-metadata' 
         'python-colcon-argcomplete' 
         'python-colcon-notification' 
         'python-colcon-powershell' 
         'python-colcon-test-result' 
         'python-colcon-package-information'
         'python-colcon-parallel-executor'
         'python-colcon-cmake'
         'python-colcon-bash'
         'python-colcon-defaults'
         'python-colcon-devtools'
         'python-colcon-package-selection'
         'python-colcon-output'
         'python-colcon-zsh')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/66/41/72f618236c6bac205abe253479100df09fddde237f3949f247e70b6e081c/colcon-common-extensions-$pkgver.tar.gz")
sha256sums=('64b2c1e5f9f560fa9c3fe19048f72e1df78b873b1a4df65c5e2b266bd37df17f')


package() {
    cd ${srcdir}/colcon-common-extensions-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

