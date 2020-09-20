# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>

pkgname=obfuscate
pkgver=1
pkgrel=3
_commit='afc08fa741f54d612c6ecfaf44985958d11eab23'
pkgdesc='Obfuscates standard input by adding or substracting a constant from each byte.'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/lopsided98/obfuscate'
license=('GPL3')
depends=('glibc')
makedepends=('git')
source=("git+https://github.com/lopsided98/obfuscate.git#commit=${_commit}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    gcc obfuscate.c -o obfuscate
}

package() {
    cd "${srcdir}/${pkgname}"
    install -dm 755 "${pkgdir}"/usr/bin/
    install -m 755 obfuscate "${pkgdir}"/usr/bin/
}

# vim: ts=4 sw=4 et:
