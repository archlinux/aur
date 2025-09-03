# Maintainer: 0.kgy <my@kaguya.org>
_tag='2025-06-09'

pkgname=hell-bin
pkgdesc='Haskell-based shell scripting language'
url=https://github.com/chrisdone/hell
pkgver=r20250609
pkgrel=1
arch=(x86_64)
license=(BSD-3-Clause)
provides=(hell)
options=(!debug)
source=("https://github.com/chrisdone/hell/releases/download/${_tag}/hell-linux-x86-64bit")
b2sums=('7d9532bdf858033af37a515c98b02213222ca5cfc93982bc0be23b4acc75ed947a4ae0cc0dc97d8b80780346fec18095d0ccf4fde7d5c0c4efdcc438a8a03d04')

pkgver() {
    awk -F- '{ print "r" $1 $2 $3 }' <<< ${_tag}
}

package() {
    install -D ${srcdir}/hell-linux-x86-64bit ${pkgdir}/usr/bin/hell
}
