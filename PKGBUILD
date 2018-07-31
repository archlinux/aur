# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=face_recognition
pkgname=python-$_pkgname
pkgver=1.2.2
pkgrel=1
pkgdesc="The world's simplest facial recognition api for Python and the command line"
url="https://github.com/ageitgey/face_recognition"
depends=('python-click'
         'python-dlib-cuda'
         'python-face_recognition_models'
         'python-numpy'
         'python-pillow'
         'python-scipy')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/e1/da/b607fc6c80eb8e82487b1cb3cff445450d712eb0456f562790c7a761f781/face_recognition-1.2.2.tar.gz")
sha256sums=('f70d92c8582113fed669832cd8036819b66eebf4a535b1b43b1c0cede0072fb7')

build(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
