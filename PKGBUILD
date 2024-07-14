# Maintainer: kaguya <my@kaguya.org>
pkgname=hell-bin
pkgver=r20240711
pkgrel=1
pkgdesc='Haskell-based shell scripting language'
arch=('x86_64')
url='https://github.com/chrisdone/hell'
license=('BSD-3-Clause')
provides=('hell')
conflicts=('hell')
options=(!debug)
_tag='2024-07-11'
source=("https://github.com/chrisdone/hell/releases/download/${_tag}/hell-linux-x86-64bit")
noextract=('hell-linux-x86-64bit')
b2sums=('da8b7175e2642dc2f5e13e6edd1f7219f2e19c49f12644b4379fc86c766a79b27a9d3aea51358a3abe2d0cc233ffc91487ead44e5bd574a21a38d0d627457e82')

pkgver() {
    awk -F- '{ print "r" $1 $2 $3 }' <<< ${_tag}
}

package() {
    install -D ${srcdir}/hell-linux-x86-64bit ${pkgdir}/usr/bin/hell
}
