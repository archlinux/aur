# Maintainer: rnons <remotenonsense at gmail dot com>
# Maintainer: ShadowKyogre <shadowkyogre dot public at gmail dot com>

pkgname=mikidown
pkgver=0.3.10
pkgrel=1
pkgdesc="A note taking application featuring markdown syntax"
arch=('any')
url="http://shadowkyogre.github.io/mikidown/"
license=('MIT')
depends=('python'
    	 'pyqt'
         'python-markdown'
         'python-whoosh')
optdepends=('python-pygments: for code block syntax highlighting'
            'python-pyenchant: for spellchecking'
            'aspell-en: pyenchant need backend support from aspell'
            'python-asciimathml: for asciimath support'
            'python-html2text: for converting to markdown (instead of HTML pasting)'
            'slickpicker: for better color picking in mikidown for the highlighting color scheme')
source=("https://pypi.python.org/packages/source/m/mikidown/mikidown-$pkgver.tar.gz")

package() {
    cd "$srcdir/mikidown-$pkgver"
    lrelease-qt4 mikidown.pro
    python setup.py install --root="$pkgdir" 
}
md5sums=('3bced7091442d681ba7d681c606a8fd2')
