# Maintainer: Aaruni Kaushik <akaushik@mathematik.uni-kl.de>
_name=maps
pkgname=maps
pkgver=0.6
pkgrel=1
pkgdesc="Sandboxing tool for Mathematical Research Software"
arch=('x86_64')
url='https://github.com/mardI4NFDI/maps/'
license=('GPL3')
depends=('base-devel'
         'openssl'
         'cairo'
         'git'
         'gobject-introspection-runtime'
         'python3'
         'ostree'
         'meson'
         'python-tomli'
         'python-tomli-w'
         'python-gobject'
         'python-progress'
         'python-tuspy'
         'xdg-utils'
         )
conflicts=('maps')
provides=('maps')
optdepends=()
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('07e90c2ca8a647b5af9fdfcc3d43666b890f742f266ea59473c11bac133d83fb')

package(){
    install -Dm 755 "$srcdir/${pkgname}-${pkgver}/src/maps" "$pkgdir/usr/bin/maps"
    install -Dm 644 "$srcdir/${pkgname}-${pkgver}/src/completion.bash" "$pkgdir/usr/share/bash-completion/completions/maps"
    install -Dm 644 "$srcdir/${pkgname}-${pkgver}/src/usr.bin.maps" "$pkgdir/etc/apparmor.d/usr.bin.maps"
    install -Dm 644 "$srcdir/${pkgname}-${pkgver}/src/maps.desktop" "$pkgdir/usr/share/applications/maps.desktop"
    xdg-mime default maps.desktop x-scheme-handler/maps
}
