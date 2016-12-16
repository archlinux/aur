# Maintainer: M0Rf30

pkgbase=python-html5lib-git
pkgname=('python2-html5lib-git' 'python-html5lib-git')
pkgver=0.999999.r4.g935783d
pkgrel=1
arch=('any')
url="https://github.com/html5lib"
license=('MIT')
makedepends=('python2' 'python' 'unzip' 'python-webencodings' 'python2-webencodings')
checkdepends=('python-six' 'python2-six' 'python2-pytest' 'python-pytest' 'python-lxml' 'python2-lxml' 'python-mock' 'python2-mock') 
source=($pkgbase::git+https://github.com/html5lib/html5lib-python.git#commit=935783d086498481fec1246a727d4fd01ec7017e
	LICENSE)
provides=('python-html5lib')
replaces=('python-html5lib')
conflicts=('python-html5lib')
package_python-html5lib-git() {
pkgdesc="A Python HTML parser/tokenizer based on the WHATWG HTML5 spec"
depends=('python' 'python-six' 'python-webencodings')
provides=('python-html5lib')
replaces=('python-html5lib')
conflicts=('python-html5lib')

    cd ${srcdir}/${pkgbase}

    python3 setup.py install --root=${pkgdir}
    install -Dm755 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE  
}

package_python2-html5lib-git() {
depends=('python2' 'python2-six' 'python2-webencodings')
pkgdesc="A Python2 HTML parser/tokenizer based on the WHATWG HTML5 spec"
provides=('python2-html5lib')
replaces=('python2-html5lib')
conflicts=('python2-html5lib')

    cd ${srcdir}/${pkgbase}

    python2 setup.py install --root=${pkgdir}
    install -Dm755 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE  
}

pkgver() {
  cd ${pkgbase}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP'
         '838c366f69b72c5df05c96dff79b35f2')
