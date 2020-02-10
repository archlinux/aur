# Maintainer: sicariusnoctis
# Previous maintainers: yubimusubi; Rob Alexander <rob at robalexander dot me>

_pkgname=mopidy-gmusic
pkgname=${_pkgname}-git
pkgver=4.0.0.r0.g88e71a1
pkgrel=1
pkgdesc="Mopidy extension for playing music from Google Play Music"
arch=('any')
url="https://github.com/mopidy/mopidy-gmusic"
license=('APACHE')
depends=(
    'mopidy'
    'python'
    'python-cachetools'
    'python-gmusicapi'
    'python-pykka'
    'python-requests'
)
makedepends=('python-setuptools' 'git')
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
    python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=4 sw=4 et:
