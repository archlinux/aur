# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=python2-ldnsx
pkgver=2012.01.25
pkgrel=2
pkgdesc="python ldns API for human beings"
url="https://github.com/colah/ldnsx"
arch=('any')
license=('BSD')
depends=("python2-setuptools" "python2-ldns")
makedepends=("git")
#optdepends=("")
source=("ldnsx::git+https://github.com/colah/ldnsx.git"
        "setup.py")
md5sums=('SKIP'
         '6e089423ad004726b55c761e8f4b05de')
 
package() {
    cd "${srcdir}/ldnsx"
    git checkout 5f7f8fa2ddb94b2db13875ec9dae3ed7549b938a 2&> /dev/null || true
    cp ../../setup.py .
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}
