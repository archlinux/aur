# Maintainer: RangS-1 <rangga19sj@gmail.com>
pkgname=bashing
_repo=Bashing
pkgver=1.0.0
pkgrel=1
pkgdesc="Bash Scripting, such as laravel environment, githelper and more"
arch=('any')
url="https://github.com/RangS-1/Bashing"
license=('MIT')

depends=(
    bash
)

makedepends=(
    
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/RangS-1/${_repo}/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('314ac521b75fb014fbb0407c49e0263f11bc011d20cf81c6530b0ba25cbe9fc9')

build() {
    cd "$srcdir/${_repo}-${pkgver}"
    BASHING_DIR="$HOME/.bashing"
    
    if [ -d "$BASHING_DIR" ]; then
        cp -r "$srcdir/${_repo}-${pkgver}"/* ~/.bashing
    else
        mkdir "$HOME/.bashing"
        cp -r "$srcdir/${_repo}-${pkgver}"/* ~/.bashing
    fi

    grep -qxF export PATH="$HOME/.bashing" ~/.bashrc || echo export PATH="$HOME/.bashing" >> ~/.bashrc
}

package() {
    cd "$srcdir/${_repo}-${pkgver}"
}