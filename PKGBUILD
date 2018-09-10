# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=face_recognition
pkgname=python-$_pkgname
pkgver=1.2.3
pkgrel=1
pkgdesc="The world's simplest facial recognition api for Python and the command line"
url="https://github.com/ageitgey/face_recognition"
depends=('python-click>=6.0'
         'python-dlib>=19.3'
         'python-face_recognition_models'
         'python-numpy'
         'python-pillow'
         'python-scipy>=0.19.0')
makedepends=('python-setuptools')
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/a3/f3/99c0fdebe04ab2ed12a6b9a6b6c568a6ae9c757da700215a24aaa8ab9070/face_recognition-1.2.3.tar.gz")
sha256sums=(a03eb709d1280bc3ca648add274ff741761b4c56f5317167252fc90cb519eda1)

build(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
