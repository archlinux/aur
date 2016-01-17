# Maintainer: Jack L. Frost <fbt@fleshless.org>
# vim: ts=2 sw=2 et:

pkgname=smdev
pkgver=0.2.3
pkgrel=6
pkgdesc='Suckless mdev'
arch=( 'i686' 'x86_64' )
url="http://git.suckless.org/smdev/"
license=( 'MIT/X' )
options=( 'strip' )
install='smdev.install'
source=(
    "http://git.suckless.org/smdev/snapshot/smdev-${pkgver}.zip"
    'smdev.install'
    'config.h'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ln -s ../config.h
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir/" install
}

sha1sums=('cefbfde0af6237ac27bb999f02b725a340d22c1d'
          'dff00e0f4fd06148b56eee1ab769b0fd976ed4eb'
          'd48c01140bf0c414fa81399963d47488670da7f0')
