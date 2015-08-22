# Contributor: Thomas Jost <schnouki@schnouki.net>
# Maintainer: SanskritFritz (gmail)

pkgname=duply
_mainver=1.10
pkgver=$_mainver.1
pkgrel=1
pkgdesc="A shell front end for duplicity. It manages backup job settings in profiles and allows to batch execute commands."
arch=('any')
url="http://duply.net/"
license=('GPLv2')
depends=('bash' 'duplicity')
source=( "duply_python2.patch"
         "http://downloads.sourceforge.net/project/ftplicity/duply%20%28simple%20duplicity%29/${_mainver}.x/${pkgname}_${pkgver}.tgz")

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  patch -p1 < "${srcdir}/duply_python2.patch"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}_${pkgver}/duply" "$pkgdir/usr/bin/duply"
}

md5sums=('adcc36b695e44387747ecc70f0a35b72'
         'b589f40ccbf3536e781aefe9b193e1ef')
