# Maintainer: Lorian Coltof <loriancoltof@gmail.com>

pkgname=python-codegrade-fs
pkgver=1.1.2
pkgrel=1
pkgdesc="Python module for the CodeGrade filesystem"
arch=('x86_64')
license=('AGPL3')

url="https://codegrade.com"
depends=('python' 'python-fusepy' 'python-requests')
makedepends=('python-setuptools' 'git')
source=("$pkgname-$pkgver::git+https://github.com/CodeGra-de/CodeGra.fs.git#commit=50d99b53fe6043382ed514377394f73d6335191f")
sha256sums=('SKIP')

build() {
    cd $pkgname-$pkgver

    python setup.py build
}

package() {
    cd $pkgname-$pkgver

    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
