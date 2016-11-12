# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-pyknp
_pkgname=pyknp
pkgver=0.3
pkgrel=1
pkgdesc="Python binding for KNP and JUMAN"
url="http://nlp.ist.i.kyoto-u.ac.jp/index.php?PyKNP"
arch=("x86_64" "i686")
license=("custom")
depends=("python")
source=("http://nlp.ist.i.kyoto-u.ac.jp/DLcounter/lime.cgi?down=http://lotus.kuee.kyoto-u.ac.jp/nl-resource/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('277e0032c8d4773926c3f1bf4153b7e8407d55e743035da380873c953c259ec7c29eb2a9c8ca10aa21f38176ee0e2dc19f608094b6ef5a93621998b5d504a846')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}
  install -Dm644 COPYING \
            ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
