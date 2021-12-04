# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=kosmorro
pkgver=0.10.7
pkgrel=1
pkgdesc='A program to calculate the ephemerides'
depends=(
    'python'
    'python-kosmorrolib>=1.0.0'
    'python-termcolor'
    'python-tabulate'
    'python-dateutil'
)

optdepends=(
    'texlive-bin: PDF creation support'
    'python-latex: PDF creation support'
)

makedepends=(
    'python-pip'
    'python-setuptools'
    'python-wheel'
    'python-babel'
    'ruby-ronn'
)

arch=('any')
url='https://kosmorro.space'
license=('AGPL3')

source=("$pkgname-v$pkgver.tar.gz::https://codeload.github.com/Kosmorro/kosmorro/tar.gz/v$pkgver")
sha256sums=("ab33921efb0448c83d3b0493883d4a97224516d5256b674f19faf2f978c0ce7f")

build() {
    cd "${srcdir}/kosmorro-${pkgver}"
    make i18n build
}

package() {
    cd "${srcdir}/kosmorro-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
