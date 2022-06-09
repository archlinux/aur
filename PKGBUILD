# Maintainer: robertfoster

pkgname=python-html5lib-git
pkgver=1.1.r9.gf7cab6f
pkgrel=1
pkgdesc="A Python HTML parser/tokenizer based on the WHATWG HTML5 spec"
arch=('any')
url="https://github.com/html5lib"
license=('MIT')
depends=('python' 'python-six' 'python-webencodings')
provides=('python-html5lib')
replaces=('python-html5lib')
conflicts=('python-html5lib')
makedepends=('python' 'unzip' 'python-webencodings')
checkdepends=('python-six' 'python-pytest' 'python-lxml' 'python-mock')
source=("${pkgname}::git+https://github.com/html5lib/html5lib-python.git"
  LICENSE
)

package() {
  cd ${srcdir}/${pkgname}

  python3 setup.py install --root=${pkgdir}
  install -Dm755 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

sha256sums=('SKIP'
            '89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e')
