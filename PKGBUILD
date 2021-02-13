# Maintainer: mojyack <mojyack at gmail.com>
pkgname=mikan-dictionary-neologd-git
pkgver=1
pkgrel=1
pkgdesc='A additional dictionary for mikan input method made from mecab-ipadic-neologd.'
arch=('any')
url='https://github.com/mojyack/mikan-dictionary-neologd'
license=('MIT')
groups=()
depends=()
makedepends=('python')
checkdepends=()
optdepends=()
provides=('mikan-additional-dictionary')
conflicts=('mikan-dictionary-neologd')
replaces=()
backup=()
options=()
install=
changelog=
source=("source::git+https://github.com/mojyack/mikan-dictionary-neologd")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd source
    printf "1.%s" "$(git rev-parse --short HEAD)"
}

build() {
    cd source
    ./build.sh
}

package() {
    cd source
    ./install.sh ${pkgdir}/usr/share/mikan-im
}

