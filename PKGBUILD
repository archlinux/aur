# Contributor: Jonathan Arnold <jdarnold@archlinux.us>
# Formerly: Atlanis <emallson@archlinux.us>
_projectname=gmusicapi
_pkgname=python2-${_projectname}
pkgname=$_pkgname-git
pkgver=VERSION
pkgrel=3
pkgdesc="Allows control of Google Music with Python"
arch=('any')
url="https://github.com/simon-weber/gmusicapi"
license=('BSD')
groups=()
depends=('python2' 'python2-validictory' 'python2-decorator' 'mutagen' 'python2-protobuf' 'python2-requests' 'python2-dateutil' 'python2-proboscis' 'python2-oauth2client' 'python2-mock' 'python2-appdirs' 'python2-six' 'python2-httplib2>=0.8' 'python2-gflags')
makedepends=('python2-setuptools' 'git')
optdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
noextract=()
source=("$_projectname::git+https://github.com/simon-weber/gmusicapi.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_projectname}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${_projectname}"

}

package() {
    cd "$srcdir/${_projectname}"
    python2 setup.py install --root="$pkgdir" --optimize=1
}

