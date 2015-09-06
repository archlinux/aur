# Maintainer: Simon Zack <simonzack@gmail.com>
# Submitter: Simon Zack <simonzack@gmail.com>
# Contributor: Nikola Milinković <nikmil@gmail.com>
# Contributor: Quentin Stievenart <quentin.stievenart@gmail.com>

_gitroot="https://github.com/Diaoul/subliminal"
_gitname="subliminal"
pkgname=python-subliminal-git
pkgrel=1
epoch=1
pkgdesc="Search and download subtitles."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=(MIT)
depends=(
    'python-beautifulsoup4>=4.2.0' 'python-guessit>=0.9.1'
    'python-requests>=2.0' 'python-enzyme>=0.4.1'
    'python-dogpile.cache>=0.5.4' 'python-click>=4.0'
    'python-pysrt>=1.0.1' 'python-six>=1.9.0'
    'python-babelfish>=0.5.2' 'python-dogpile.core'
    'python-chardet>=2.3.0' 'python-stevedore>=1.0.0'
    'python-dateutil>=2.1'
)
makedepends=('python-setuptools')
conflicts=('subliminal' 'subliminal-git')
source=("${_gitname}::git+${_gitroot}.git")
md5sums=('SKIP')

pkgver() {
    cd ${_gitname}
    git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd ${srcdir}/${_gitname}
    python setup.py install --root="${pkgdir}/" --optimize=1
}
