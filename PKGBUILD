# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=lib_users
pkgver=0.12
pkgrel=1
pkgdesc='Checks /proc for libraries being mapped but marked as deleted'
arch=('any')
url='http://www.schwarzvogel.de/software/lib_users.html'
license=('GPL2')

 # works with any version of python, you can set this to "python2" or "python3"
_python="python"

depends=("$_python")
source=("http://schwarzvogel.de/pkgs/${pkgname}-${pkgver}.tar.gz")
md5sums=('93729682e6bbf166d7da63122f93fbb3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  "$_python" setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  "$_python" setup.py install --prefix=/usr --root="${pkgdir}"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/lib_users/README.md"
}
