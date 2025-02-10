# Maintainer: Charles Dong <chardon_cs@proton.me>

_pkgbase=ollama-lab
pkgname=$_pkgbase-bin
pkgver=0.1.0+beta.2
_version=${pkgver/+/-}
pkgrel=1
epoch=
pkgdesc="Yet another (unofficial) Ollama GUI (binary)"
arch=('x86_64')
url="https://github.com/chardoncs/ollama-lab"
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
    "https://github.com/chardoncs/ollama-lab/releases/download/v${_version}/${_pkgbase}_${_version}_amd64.deb"
)
noextract=()
sha256sums=(
    '318c31efbc39ef77c81336b8febe060a580c8c2d10e6a85f2f48838332681667'
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
