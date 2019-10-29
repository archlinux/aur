# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='sublime-music'
pkgname=('sublime-music')
_module='sublime-music'
pkgver='0.8.6'
pkgrel=1
pkgdesc='A native Subsonic/Airsonic/*sonic client for Linux. Build using Python and GTK+.'
url='https://gitlab.com/sumner/sublime-music'
depends=(
    'python'
    'python-bottle'
    'python-deepdiff'
    'python-deprecated'
    'python-fuzzywuzzy'
    'python-gobject'
    'python-pychromecast'
    'pygobject-devel'
    'python-dateutil'
    'python-levenshtein'
    'python-mpv'
    'python-yaml'
    'python-requests'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=('https://files.pythonhosted.org/packages/source/s/sublime-music/sublime-music-0.8.6.tar.gz')
sha256sums=('24594be0a2ad43cc3a1b8104a16deeed191706d72fedb4dec2ad52d3e6ff433c')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
