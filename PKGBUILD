# Maintainer: Efaile <seebeckemily3403@gmail.com>

pkgname=suwudo
pkgver=0.1
pkgrel=1
pkgdesc='girl-ify your sudo experience!'
url='https://github.com/Emily3403/Suwudo'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
provides=('suwudo')
source=("$pkgname::git+https://github.com/Emily3403/Suwudo.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    cat VERSION
}

build() {
    cd $pkgname
    ./suwudo.py
}

package_suwudo() {
    cd $pkgname

    install -D -m644 "sudoers.so" "$pkgdir/usr/lib/sudo/sudoers.so"
}