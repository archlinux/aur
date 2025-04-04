# Maintainer: mojyack <mojyack at gmail.com>
pkgname=mecab-shogo82148-git
pkgver=0.996.10
pkgrel=1
pkgdesc='Unofficial fork of taku910/mecab'
arch=($CARCH)
url='https://github.com/shogo82148/mecab'
conflicts=('mecab')
provides=('mecab')
license=('BSD-3-Clause AND GPL-2.0-or-later AND LGPL-2.1-or-later')
makedepends=('git')
source=("${pkgname}::git+https://github.com/shogo82148/mecab.git")
md5sums=('SKIP')

build() {
    cd "${pkgname}/mecab"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --with-charset=utf-8
    make
}

package() {
    cd "${pkgname}/mecab"
	make DESTDIR="$pkgdir/" install
}
