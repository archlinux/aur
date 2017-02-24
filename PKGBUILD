pkgname=python2-pydrive
pkgver=1.3.1
pkgrel=0
pkgdesc='Google Drive API made easy.'
url='https://github.com/googledrive/PyDrive'
license=('Apache')
arch=('any')
depends=('python2-google-api-python-client' 'python2-yaml')
makedepends=('python2-setuptools')
source=('https://pypi.python.org/packages/52/e0/0e64788e5dd58ce2d6934549676243dc69d982f198524be9b99e9c2a4fd5/PyDrive-1.3.1.tar.gz#md5=99c51a87c22edaed718b1bc8d00058e9')
sha256sums=('83890dcc2278081c6e3f6a8da1f8083e25de0bcc8eb7c91374908c5549a20787')


build() {
    cd "$srcdir/PyDrive-${pkgver}"

    python2 setup.py build
}


package() {
    cd "${srcdir}/PyDrive-${pkgver}"

    python2 setup.py install --optimize=1 "--root=${pkgdir}"
}
