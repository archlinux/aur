# Maintainer: ShadowKyogre <shadowkyogre dot public at gmail dot com>
# Contributor: rnons <remotenonsense at gmail dot com>

pkgname=mikidown-git
_githubuser=ShadowKyogre
_gitname=mikidown
pkgver=0.3.7.r0.g3c65f50
pkgrel=1
pkgdesc="A note taking application featuring markdown syntax"
arch=('any')
url="https://shadowkyogre.github.com/mikidown"
license=('MIT')
makedepends=('git')
depends=('pyqt'
         'python-markdown'
         'python-whoosh')
optdepends=('python-pygments: for code block syntax highlighting'
            'python-pyenchant: for spellchecking'
            'aspell-en: pyenchant need backend support from aspell'
            'python-asciimathml: for asciimath support' 
            'python-html2text: for converting to markdown (instead of HTML pasting)' 
            'slickpicker: for better color picking in mikidown for the highlighting color scheme')
provides=('mikidown')
conflicts=('mikidown')
source=("git://github.com/${_githubuser}/${_gitname}.git")
md5sums=(SKIP)

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package(){
    cd "${srcdir}/${_gitname}"
    python setup.py install --root="$pkgdir"
}
