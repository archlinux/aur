# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=python-gifsicle
pkgver=1.0.1
pkgrel=2
pkgdesc='Python package wrapping the gifsicle library for editing and optimizing gifs'
arch=('any')
url='https://pypi.org/project/pygifsicle/'
license=('MIT')
depends=('python' 'gifsicle')
source=('https://files.pythonhosted.org/packages/0c/13/1bb7b88fe584182dd0431250f0e2d54316b20c21541bf90b76876d773597/pygifsicle-1.0.1.tar.gz')
sha256sums=('21553132025952f0a41b4605e1de2f4f89d57c8c97357db5fa5cfd85ad8e6c2f')
     
prepare() {
    cd pygifsicle-${pkgver}
    
    sed -i 's|elif platform.system() == "Linux"|elif platform.system() == "FFS"|g' setup.py
}

package() {
    cd pygifsicle-${pkgver}
    
    python setup.py install --root="${pkgdir}/" --optimize=1
}
