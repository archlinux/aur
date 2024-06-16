# Maintainer: Lennyy1337 <lennyy1337@proton.me>
pkgname=krokodil-git
pkgver=1.0.2
pkgrel=1
pkgdesc="The most advanced cross-platform discord nuker made in C still in developing"
arch=('any')
url="https://github.com/UsboKirishima/krokodil"
license=('MIT')
depends=('gtk3' 'zenity' 'curl' 'cowsay' 'lolcat')
makedepends=('git')
source=("https://github.com/UsboKirishima/krokodil.git")
install=.install

build() {
    rm -rf krokodil

    git clone $source
    cd "krokodil"
    make install
    
}

package() {
    if [ ! -e "/bin/krokodil" ]; then
        sudo mv /bin/krokodil $pkgdir
    else
        build
        sudo mv /bin/krokodil $pkgdir
    fi
    
    sudo cp $pkgdir/krokodil /usr/local/bin
}

check(){
    echo wokrs
}


sha256sums=('SKIP')
