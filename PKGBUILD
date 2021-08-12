# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=lib_users
pkgver=0.14
pkgrel=1
pkgdesc='Checks /proc for libraries being mapped but marked as deleted'
arch=('any')
url='https://github.com/klausman/lib_users/'
license=('GPL2')

 # works with any version of python, you can set this to "python2" or "python3"
_python="python"

depends=("$_python")
source=("https://github.com/klausman/lib_users/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('264f8a76451174691767ca23d352e3cf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  "$_python" setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  "$_python" setup.py install --prefix=/usr --root="${pkgdir}"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/lib_users/README.md"
}
