# Maintainer: Kye Hunter <kye(dot)evan(dot)hunter(at)gmail(dot)com>

_name=agunua
pkgname=python-agunua-git
_pkgname=${pkgname%%-git}
pkgver=1.7.1
pkgver() {
    sed -nr '/version/s/^.*="(.*)".*$/\1/p' ${srcdir}/${_name}/setup.py
}
pkgrel=1
pkgdesc="Python library for the development of Gemini clients"
arch=(any)
url="https://framagit.org/bortzmeyer/agunua"
license=('GPLv2')
#install='snd_hda_macbookpro.install'
depends=(
    'python-pyopenssl'
    'python-pysocks'
    'python-netaddr'
)
makedepends=(
    'python-setuptools'
)
provides=(
    $_pkgname
)
conflicts=(
    $_pkgname
)
source=('git+https://framagit.org/bortzmeyer/agunua.git')
sha256sums=('SKIP')

package() {
    cd $srcdir/$_name
    python setup.py install --root="$pkgdir" --optimize=1
}

