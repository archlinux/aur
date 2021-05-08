# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
_libname=activation
pkgname=java-${_libname}-gnu
pkgver=1.1.2
pkgrel=2
pkgdesc="JavaBeans Activation Framework (JAF), framework for declaring what beans operate on what MIME type data"
arch=('any')
url="https://www.gnu.org/s/classpathx/jaf/jaf.html"
license=('LGPL')
depends=('java-runtime-headless')
makedepends=('apache-ant')
source=(https://ftp.gnu.org/gnu/classpathx/${_libname}-${pkgver}.tar.gz{,.sig})
validpgpkeys=('2875BCCCAE65860C6087CA8FE9D9750C4A8782B8') # Chris Burdess
sha512sums=('26534f7bb47daddf97b850ab74fc8ef2c5bd62d12cfb96e28e235071af7dcfc7761fa15f2d8f3a2d194f035665cef127812b7476af6cc81f6d6374f1fa725584'
            'SKIP')

build() {
  cd ${_libname}-${pkgver}

  ant dist
}

package() {
  install -Dm644 ${_libname}-${pkgver}/activation.jar \
                 "${pkgdir}"/usr/share/java/${_libname}-${pkgver}.jar

  ln -s ${_libname}-${pkgver}.jar "${pkgdir}"/usr/share/java/${_libname}.jar
}
