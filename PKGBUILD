# Maintainer: Sam Ezeh <sam.z.ezeh@gmail.com>
_commit=d571a4424fb0cf08b29fbfccfddd092ea969eae3
arch=('any')
conflicts=('kaldi-srilm')
depends=()
license=('custom')
makedepends=('make' 'git')
pkgdesc="The SRI Language Modelling Toolkit "
pkgname=srilm
pkgrel=1
pkgver=1.7.3
sha256sums=('SKIP')
source=(git+https://github.com/dignissimus/SRILM#commit="$_commit")
url="https://www.speech.sri.com/projects/srilm/"

build() {
    make -C "$srcdir/SRILM" SRILM="$srcdir/SRILM"
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    for file in "$srcdir"/SRILM/bin/**/*; do
        if [ -f "$file" ]; then
            cp "$file" "$pkgdir/usr/bin/"
        fi
    done
}

