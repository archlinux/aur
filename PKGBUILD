# Maintainer: mojyack <mojyack at gmail.com>
pkgname=mikan-dictionary-git
pkgver=1.db79f5b
pkgrel=2
pkgdesc='Dictionaries for mikan input method.'
arch=('any')
url='https://github.com/mojyack/mikan-dictionary'
license=('MIT')
depends=()
makedepends=('mecab' 'python')
optdepends=()
provides=('mikan-dictionary')
conflicts=('mikan-dictionary')
source=("source::git+https://github.com/mojyack/mikan-dictionary")
md5sums=('SKIP')

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

