# Maintainer: Efaile <seebeckemily3403@gmail.com>
# Attention: Currently it is not possible to install!

pkgname=suwudo
pkgver=0.1
pkgrel=1
pkgdesc='girl-ify your sudo experience!'
url='https://github.com/Emily3403/Suwudo'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
provides=('suwudo')
source=("$pkgname::git+https://github.com/Emily3403/Suwudo.git")
# source=("$pkgname::git+https://github.com/Emily3403/Suwudo.git" '/usr/lib/sudo/sudoers.so')
sha256sums=('SKIP')

pkgver() {
    echo '0.1'
}

build() {
    cd $pkgname
    ./suwudo.py
}

package_suwudo() {
    cd $pkgname

    echo "
Attention:
Due to limitations of pacman and the aur it is currently not able to install this part automatically

Do it yourself by executing the following into any posix compliant shell (will segfault):

    sudo cp $HOME/.cache/yay/suwudo/src/suwudo/sudoers.so /usr/lib/sudo/sudoers.so

";   exit 1

    install -D -m644 "sudoers.so" "$pkgdir/usr/lib/sudo/sudoers.so"
}