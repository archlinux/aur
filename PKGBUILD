# Maintainer: 0.kgy <my@kaguya.org>
_tag='2025-03-04'

pkgname=hell-bin
pkgdesc='Haskell-based shell scripting language'
url=https://github.com/chrisdone/hell
pkgver=r20240711
pkgrel=1
arch=(x86_64)
license=(BSD-3-Clause)
provides=(hell)
options=(!debug)
source=("https://github.com/chrisdone/hell/releases/download/${_tag}/hell-linux-x86-64bit")
b2sums=('64d50778503fd223b296828c509e6989003c6d5682d5d9855d9e7924e7c4ffaa5b933f2772239ec21cfca57ed32dd82d14b2d2b757504750807c6cc428e08590')

pkgver() {
    awk -F- '{ print "r" $1 $2 $3 }' <<< ${_tag}
}

package() {
    install -D ${srcdir}/hell-linux-x86-64bit ${pkgdir}/usr/bin/hell
}
