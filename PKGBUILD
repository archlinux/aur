# Maintainer: Richard Neumann aka. rne <r dot neumann at homeinfo fullstop de>

pkgname='python-magic-git'
pkgver='0.4.6'
pkgrel=5
pkgdesc="Python 3 packages for alternative (github) implementation of python-magic"
arch=('any')
url='https://github.com/ahupp/python-magic'
license=('MIT')
depends=('python')
makedepends=('git' 'python' 'python-setuptools')
conflicts=('python-magic')
source=("${pkgname}::git+https://github.com/ahupp/python-magic")
md5sums=('SKIP')
pkgdir='pkg'
srcdir='src'


package() {
    local LICENSE_DIR="${pkgdir}/usr/share/licenses/${pkgname}"

    # Set up directories
    install -d -m 755 ${LICENSE_DIR}

    cd "${srcdir}/${pkgname}"

    # Install python packages to $pkgdir
    python setup.py install --root ${pkgdir}

    # Install license file
    install -m 644 LICENSE ${LICENSE_DIR}
}

