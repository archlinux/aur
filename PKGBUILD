# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='python2-rst-converters-stable-git'
pkgver=0.15.0.12c14d2
pkgrel=1
pkgdesc='Robotics Systems Types converter for Python'
arch=(any)
url='https://projects.cor-lab.org/projects/rst'
license=('LGPL3')
depends=('python2' 'python2-protobuf' 'python2-rsb-stable-git' 'rst-proto-stable-git' 'python2-numpy')
makedepends=('git' 'python2-setuptools')
source=("python2-rst-converters::git+https://code.cor-lab.org/git/rst.git.converters-python#branch=0.15")
md5sums=('SKIP')
conflicts=('python2-rst-converters')
provides=('python2-rst-converters')

pkgver() {
    cd "${srcdir}/python2-rst-converters"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/python2-rst-converters"
    python2 setup.py bdist_egg
}

check() {
    cd "${srcdir}/python2-rst-converters"
    python2 setup.py test
}

package() {
    cd "${srcdir}/python2-rst-converters"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}
