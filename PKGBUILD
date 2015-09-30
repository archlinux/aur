# Maintainer: Richard Neumann aka. rne <r dot neumann at homeinfo fullstop de>

pkgname='python-homeinfo'
pkgver='3.0.0'
pkgrel=1
pkgdesc="A multi purpose python library"
arch=('any')
url='https://github.com/HOMEINFO/homeinfo-lib'
license=('GPL3')
depends=('python')
makedepends=('git' 'python')
# Replace for legacy installations
replaces=('python-homeinfo-lib' 'python-homeinfo-lib-extra')
source=("${pkgname}::git+https://github.com/HOMEINFO/homeinfo-lib")
md5sums=('SKIP')
pkgdir='pkg'
srcdir='src'


package() {
    local USR_PATH="${pkgdir}/usr"
    local LICENSE_DIR="${USR_PATH}/share/licenses/${pkgname}"

    # Set up directories
    install -d -m 755 ${USR_PATH}
    install -d -m 755 ${LICENSE_DIR}

    cd "${srcdir}/${pkgname}"

    # Install python packages to $pkgdir
    python setup.py install --root ${pkgdir} --optimize=1

    # Install license file
    install -m 644 LICENSE ${LICENSE_DIR}
}

