# Maintainer: Tilman Blumenbach <tilman (at) ax86 (dot) net>

pkgbase='selfhtml'
pkgname=('selfhtml-de' 'selfhtml-fr')
pkgver='8.1.2'
pkgdesc='An excellent HTML reference which also covers other web topics'
pkgrel=5
arch=('any')
url='http://selfhtml.org'
license=('custom')
source=('http://files.ax86.net/mirror/selfhtml/selfhtml812.tar.xz'
        'http://files.ax86.net/mirror/selfhtml/selfhtml80fr.tar.xz'
        'http://files.ax86.net/mirror/selfhtml/selfhtml80fr_update812.tar.xz')

# $1: Language code
_do_package() {
    mkdir -p "$pkgdir/usr/share/doc/selfhtml/$1"
    mkdir -p "$pkgdir/usr/share/licenses/selfhtml/$1"

    cp -a . "$pkgdir/usr/share/doc/selfhtml/$1"
    ln -s "/usr/share/doc/selfhtml/$1/editorial/copyright.htm" "$pkgdir/usr/share/licenses/selfhtml/$1"
}

package_selfhtml-de() {
    # Need to do this here so that mkaurball correctly extracts these variables.
    pkgdesc="An excellent HTML reference which also covers other web topics (German version)"
    url="http://de.selfhtml.org"

    cd "$srcdir/selfhtml812"
    _do_package de
}

package_selfhtml-fr() {
    # Need to do this here so that mkaurball correctly extracts these variables.
    pkgdesc="An excellent HTML reference which also covers other web topics (French version)"
    url="http://fr.selfhtml.org"

    cd "$srcdir/selfhtml80fr"
    _do_package fr
}

md5sums=('498cef61ba58aca47e5601d8b41181e1'
         'a92011c71a6a211c727a7dc87910aa4e'
         'f4c45c2fe4a28eb8b27a29cb59d5b474')
sha384sums=('26b02844e55de2974257fdfbc6fea88caadc516735097167d3522a247d077911b77d4d059c9bd08d0e0d37ebc2704193'
            'b9bc42c0d2ec0846e1040618eb0d965129b4bcabcc96109c35b059ac212d97d8d6f0e3ec0b4f2fbcafed2982e612cdf9'
            'fa1e53b7511d77bf00ce7744fff1dedd975273ed894148870f398a683f762f530d4df6f7cc578b95d0fad85f448c91f0')
