# Maintainer: Alex Grabowski <hurufu+aur@gmai.com>
pkgname=tau-prolog
pkgver=0.3.3
pkgrel=1
pkgdesc='An open source Prolog interpreter in JavaScript'
arch=(any)
url='http://tau-prolog.org/'
license=(BSD-3-Clause)
makedepends=(npm)
options=(!strip)
source=(https://github.com/tau-prolog/tau-prolog/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('d764eea5e31544970d1c273620741553ec403800ca67c552982b0b12b5630fa1')
noextract=("v$pkgver.tar.gz")

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir/v$pkgver.tar.gz"

    # TODO: Write proper CLI node module
    install -Dv -t "$pkgdir/usr/share/tauprolog" ../tau.js ../tau.d.ts

    find "$pkgdir" -type f -exec chmod a-x '{}' '+'
    find "$pkgdir" -type f -name '*.sh' -exec chmod a+x '{}' '+'
}
