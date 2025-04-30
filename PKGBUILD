# Maintainer: Charles Dong <chardon_cs@proton.me>

_pkgbase=ollama-lab
pkgname=$_pkgbase-bin
pkgver=0.4.1
_version=${pkgver/+/-}
pkgrel=1
epoch=
pkgdesc="Yet another (unofficial) Ollama GUI (binary)"
arch=('x86_64')
url="https://github.com/ollama-lab/ollama-lab"
license=('MIT')
groups=()
depends=(
    'gtk3'
    'sqlite'
    'webkit2gtk-4.1'
)
makedepends=()
checkdepends=()
optdepends=('ollama')
provides=($_pkgbase)
conflicts=($_pkgbase)
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/ollama-lab/${_pkgbase}/releases/download/v${_version}/${_pkgbase}_${_version}_amd64.deb"
)
noextract=()
sha256sums=(
    '9600cad1013d412e477139b85394e7a5dc41ce0d609d419d79d6527c8d521a2e'
)
validpgpkeys=()

_target_dir="${_pkgbase}-${_version}"

prepare() {
    mkdir -p $_target_dir
    cd $_target_dir

    tar xzf ../data.tar.gz
}

package() {
    cp -r $srcdir/${_target_dir}/* $pkgdir/
}
