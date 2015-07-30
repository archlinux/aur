# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Ghost of Kendo <ghostofkendo at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Pierre Chapuis <catwell@archlinux.us>

pkgname=spin
pkgver=6.4.3
pkgrel=1
pkgdesc='Tool for the formal verification of distributed software systems.'
arch=('i686' 'x86_64')
url='http://spinroot.com/'
license=('custom:SPIN')
depends=('glibc')
source=("http://spinroot.com/spin/Src/src${pkgver//./}.tar.gz"
        'LICENSE.txt')
DLAGENTS='http::/usr/bin/curl -A "Mozilla/4.0" -fLC - --retry 3 --retry-delay 3 -o %o %u'
md5sums=('8f49cf98fe7bc2ac08f75ad29280843a'
         '1b7db1b5f5da972bab3db17472e3a342')

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
