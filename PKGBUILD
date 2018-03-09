# Contributor: Frank Fishburn <frankthefishburn@gmail.com>
# Maintainer: Frank Fishburn <frankthefishburn@gmail.com>
pkgname=python-nipype
_name=${pkgname/python-/}
pkgver=1.0.1
pkgrel=2
pkgdesc='Neuroimaging in python pipelines and interfaces'
arch=('any')
url='https://pypi.python.org/pypi/prov/'
license=('Apache')
depends=('python-numpy' 'python-numpydoc' 'python-scipy' 'python-networkx' 'python-traits' 'python-dateutil' 'python-nibabel' 'python-future' 'python-simplejson' 'python-prov' 'python-click' 'python-funcsigs' 'python-pytest' 'python-mock' 'python-pydotplus' 'python-pydot' 'python-packaging')
optdepends=('fsl' 'afni')
source=("https://github.com/nipy/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('b06d1504e27cfdca51dcf3b821223b5913f37d87a637a235a0e3bef1cff19951')

build() {
    cd ${srcdir}/${_name}-${pkgver}
    make
}

package() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

