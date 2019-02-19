# Maintainer: Tharre <tharre3@gmail.com>

pkgname=grokmirror
pkgver=1.2.0
pkgrel=1
pkgdesc='Framework to smartly mirror git repositories'
url='https://git.kernel.org/pub/scm/utils/grokmirror/grokmirror.git'
arch=('any')
license=('GPL3')
depends=('python-setuptools' 'python-anyjson' 'python-gitpython'
         'python-enlighten')
source=(https://git.kernel.org/pub/scm/utils/grokmirror/grokmirror.git/snapshot/grokmirror-${pkgver}.tar.{gz,asc})
validpgpkeys=('DE0E66E32F1FDD0902666B96E63EDCA9329DD07E') # Konstantin Ryabitsev
sha256sums=('SKIP'
            'SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -Dm644 -t "${pkgdir}/usr/share/man/man1/" "man/"*.1
}
