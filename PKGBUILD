# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=janet-lang-bin
pkgver=1.18.0
pkgrel=1
pkgdesc='A dynamic Lisp dialect and bytecode vm'
arch=('x86_64')
url='https://janet-lang.org/'
license=('MIT')
provides=('janet')
conflicts=('janet-lang' 'janet-lang-git')

source=("https://github.com/janet-lang/janet/releases/download/v${pkgver}/${pkgname/\-lang-bin/}-v${pkgver}-linux-x64.tar.gz" "https://github.com/janet-lang/janet/releases/download/v${pkgver}/${pkgname/\-lang-bin/}.h")

sha256sums=('f3d2c148e28beed108fc336510ea4e88a84aa5ee2d2d46380230c6639a4db31c'
            '7420414dc283b59a0d6a5b93e64df61f81c7102d352dc9028d2081acd6e1ea6e')

package() {
  install -Dm755 "${srcdir}/${pkgname/\-lang-bin/}-v${pkgver}-linux/bin/janet" "${pkgdir}/usr/bin/janet"
  install -Dm755 "${srcdir}/${pkgname/\-lang-bin/}-v${pkgver}-linux/bin/jpm" "${pkgdir}/usr/bin/jpm"
  install -dm777 "${pkgdir}/usr/local/lib/janet"
  install -dm777 "${pkgdir}/usr/local/lib/janet/.cache"
  install -Dm644 "${srcdir}/janet.h" "${pkgdir}/usr/include/janet.h"
}
