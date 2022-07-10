# Maintainer: Romain Grégoire <romgrk.cc@gmail.com>
pkgname=interception-vimproved-git
pkgver=f4aa0fa
pkgrel=1
pkgdesc='vimproved: unofficial plugin for Interception Tools combining features of caps2esc and space cadet for making held space work as a special fn key.'
arch=('any')
license=('Apache-2.0')
url='https://github.com/maricn/interception-vimproved'
depends=('interception-tools')
makedepends=('make' 'gcc' 'git')
source=("$pkgname::git+https://github.com/maricn/interception-vimproved/")
md5sums=(SKIP)

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    make
}

package() {
    cd ${srcdir}/${pkgname}

    make INSTALL_FILE="$pkgdir/usr/bin/interception-vimproved" install
}
