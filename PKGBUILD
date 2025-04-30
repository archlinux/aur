# Maintainer: Charles Dong <chardon_cs@proton.me>

_pkgbase=ollama-lab
pkgname=$_pkgbase-bin
pkgver=0.4.0
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
    'f6ef0f1f78ed233254670a5aaf97e46d2193d9cea831ac0d6feb7ceb37df7de8'
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
