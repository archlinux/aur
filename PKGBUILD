# Maintainer: Rob Alexander <rob at robalexander dot me>

_pkgname=mopidy-gmusic
pkgname=${_pkgname}-git
pkgver=1.0.0.r0.g07487f8
pkgrel=1
pkgdesc="Mopidy extension for playing music from Google Play Music"
arch=('any')
url="https://github.com/mopidy/mopidy-gmusic"
license=('APACHE')
depends=(
    'python2'
    'python2-requests'
    'python2-pykka'
    'python2-gmusicapi'
    'mopidy'
)
makedepends=('python2-setuptools' 'git')
provides=(${_pkgname})
conflicts=(${_pkgname})
options=(!emptydirs)
source=("${_pkgname}::git+https://github.com/mopidy/mopidy-gmusic.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=4 sw=4 et:
