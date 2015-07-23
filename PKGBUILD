# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Quentin Stievenart <quentin.stievenart@gmail.com>

_gitroot="https://github.com/Diaoul/subliminal"
_gitname="subliminal"
pkgname=${_gitname}-git
pkgver=1.0.1
pkgrel=1
epoch=1
pkgdesc="Search and download subtitles."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=(MIT)
depends=('python2-beautifulsoup4>=4.2.0' 'python2-guessit>=0.9.1'
	 'python2-requests>=2.0' 'python2-enzyme>=0.4.1'
	 'python2-dogpile-cache>=0.5.4' 'python2-click>=4.0'
	 'python2-pysrt>=1.0.1' 'python2-six>=1.9.0'
	 'python2-babelfish>=0.5.2' 'python2-dogpile-core'
	 'python2-chardet>=2.3.0' 'python2-stevedore>=1.0.0'
	 'python2-dateutil>=2.1')
makedepends=('python2-setuptools')
conflicts=(${_gitname})
source=("${_gitname}::git+${_gitroot}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}/${_gitname}
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
