# Maintainer: Alexander 'chron' Kempen <chronischzuspaet at gmail dot com>
pkgname=httpdiff-git
_pkgname=httpdiff
pkgver=31.7887644
pkgrel=1
pkgdesc='Perform the same request against two HTTP servers and diff the results'
arch=('i686' 'x86_64')
url='https://github.com/jgrahamc/httpdiff'
license=('GPL2')
makedepends=('git' 'go')
source=('git+https://github.com/jgrahamc/httpdiff')

sha256sums=('SKIP')

build() {
    cd ${srcdir}/${_pkgname}
    make all
}

package() {
    cd ${srcdir}/${_pkgname}
    install -Dm 755 "${srcdir}/${_pkgname}/httpdiff" "${pkgdir}/usr/bin/httpdiff"
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

pkgver() {
    cd $srcdir/${_pkgname}
    echo $(git rev-list --count master).$(git rev-parse --short master)
}
