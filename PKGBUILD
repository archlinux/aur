# Maintainer: Aaruni Kaushik <akaushik@mathematik.uni-kl.de>
_name=maps
pkgname=maps
pkgver=0.5
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
sha256sums=('1c171d67ab67a2f1425d4bfa56b4681b8733fde95041feb4677aeeb39e6e3edb')

package(){
    install -Dm 755 "$srcdir/${pkgname}-${pkgver}/src/maps" "$pkgdir/usr/bin/maps"
    install -Dm 644 "$srcdir/${pkgname}-${pkgver}/src/completion.bash" "$pkgdir/usr/share/bash-completion/completions/maps"
    install -Dm 644 "$srcdir/${pkgname}-${pkgver}/src/usr.bin.maps" "$pkgdir/etc/apparmor.d/usr.bin.maps"
    install -Dm 644 "$srcdir/${pkgname}-${pkgver}/src/maps.desktop" "$pkgdir/usr/share/applications/maps.desktop"
    xdg-mime default maps.desktop x-scheme-handler/maps
}
