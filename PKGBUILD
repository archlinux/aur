pkgname=simplecv
pkgver=1.3
pkgrel=2
pkgdesc='Framework for computer (machine) vision in Python, providing a unified, Pythonic interface to image aquisition, conversion, manipulation, and feature extraction.'
url='http://simplecv.org/'
license=('BSD')
arch=('any')
depends=('opencv' 'python2-pillow' 'python2-pygame' 'python2-scipy')
makedepends=('python2-setuptools')
optdepends=('ipython2: for using SimpleCV with the IPython Notebook')
conflicts=('simplecv-git')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgver}/SimpleCV-${pkgver}.tar.gz")
sha256sums=('7a0aaf61f357a78429ff4409f75d4ac67b9924f06013245706a3ccfcff8c92b0')


build() {
    cd SimpleCV
    python2 setup.py build
}


package() {
    cd SimpleCV
    python2 setup.py install "--root=${pkgdir}" --optimize=1
    install -D --mode=u=rw,go=r LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
