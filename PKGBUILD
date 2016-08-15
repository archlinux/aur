# Maintainer: rnons <remotenonsense at gmail dot com>
# Maintainer: ShadowKyogre <shadowkyogre dot public at gmail dot com>

_url_hashid="20/a0/94eab1cf9468b5772eb6b9cca843f8a3fda5ead5f7326ec2ea40f5499ee6"
pkgname=mikidown
pkgver=0.3.11
pkgrel=1
pkgdesc="A note taking application featuring markdown syntax"
arch=('any')
url="http://shadowkyogre.github.io/mikidown/"
license=('MIT')
depends=(
    'python'
    'python-pyqt5'
    'python-markdown'
    'python-whoosh'
)
optdepends=(
    'python-pygments: for code block syntax highlighting'
    'python-pyenchant: for spellchecking'
    'aspell-en: pyenchant need backend support from aspell'
    'python-asciimathml: for asciimath support'
    'python-html2text: for converting to markdown (instead of HTML pasting)'
    'slickpicker: for better color picking in mikidown for the highlighting color scheme'
)
source=("https://pypi.python.org/packages/${_url_hashid}/mikidown-0.3.11.tar.gz")

package() {
    cd "$srcdir/mikidown-$pkgver"
    lrelease-qt5 mikidown.pro
    python setup.py install --root="$pkgdir" 
}
md5sums=('5f54f665d526f95f93171143d1ab5fb2')
