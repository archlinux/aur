# Maintainer: Tom Willemse <tom@ryuslash.org>

_gitname='mowedline'

pkgname=mowedline-git
pkgver=20150608
pkgrel=1
pkgdesc="an X status bar program"
depends=('chicken' 'chicken-coops' 'chicken-dbus>=0.92'
         'chicken-filepath' 'chicken-imperative-command-line-a>=0.4'
         'chicken-list-utils' 'chicken-mailbox' 'chicken-matchable'
         'chicken-miscmacros' 'chicken-xft' 'chicken-xlib'
         'chicken-xtypes')
conflicts=('mowedline')
provides=('mowedline')
arch=('x86_64')
url='http://retroj.net/mowedline'
license=('GPL3')
source=('git://github.com/retroj/mowedline.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git log -1 --pretty=format:"%cd" --date=short | sed s/-//g
}

package() {
    cd "${srcdir}/${_gitname}"
    chicken-install -p "${pkgdir}/usr"
}
