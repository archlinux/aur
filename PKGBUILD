# Maintainer: MatToufoutu <echo bWF0dG91Zm9vdHUrYXVyQGdtYWlsLmNvbQo= | base64 -d>

pkgname=python2-kinterbasdb
pkgver=3.2
pkgrel=1
pkgdesc="A Python Extension Package for the Firebird and Interbase® Relational Databases"
arch=('any')
url='http://kinterbasdb.sourceforge.net/'
license=('LGPL')
depends=('python2')
makedepends=('libfbclient')
source=(
	"drop_removed_fb_defines.patch"
	"http://downloads.sourceforge.net/project/kinterbasdb/kinterbasdb/kinterbasdb-${pkgver}/kinterbasdb-${pkgver}.src.tar.gz"
)
md5sums=('2d937243518427ae5a80065b11af8b5c'
         '626fdd387475cd2a747b40229f1edd92')
sha1sums=('edd95c8c56982055607083880d9f23e730e60ce5'
          'd82c89478737eb324bf899afefdb91b3557f568f')
sha256sums=('d24bd55bec736cbba590af06f9d2f02def226800708d09b2fcb52976b5050e18'
            'd1b86b79450fa0dd69311255e0907cd1fe497dcd48692ccf6cb4397a998219ee')

prepare() {
	cd "${srcdir}/kinterbasdb-${pkgver}"
	patch -Np1 < "${startdir}/drop_removed_fb_defines.patch"
}

package() {
  cd "${srcdir}/kinterbasdb-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}