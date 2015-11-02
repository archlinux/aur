# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Ghost of Kendo <ghostofkendo at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Pierre Chapuis <catwell@archlinux.us>

pkgname=spin
pkgver=6.4.4
pkgrel=1
pkgdesc='Tool for the formal verification of distributed software systems.'
arch=('i686' 'x86_64')
url='http://spinroot.com/'
license=('custom:SPIN')
depends=('glibc')
source=("http://spinroot.com/spin/Src/src${pkgver//./}.tar.gz"
        'LICENSE.txt')
sha512sums=('d40fe053775d8a8a599fdbc572c1eb03a3ca78f9f443b75c6ea910f3c0183f02393b09c1d2da1eb8798b5b81b4bc752a7a4f456b852a8f5055847ff720b78caf'
            'a5b63fc7136a2631c9a27619953abe2e9d6cab179042dd56bb76afbffe1966ad7edb41a131af5d6663f3cdbf77128833232e9174c0ef817b8522bfd978add595')

build() {
  cd Src${pkgver}
  make
}

package() {
  cd Src${pkgver}

  install -D spin \
    ${pkgdir}/usr/bin/spin

  install -D -m644 ${srcdir}/LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
