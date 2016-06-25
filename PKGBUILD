# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Contributor: sergeantspoon <sergeantspoon@archlinux.us>

pkgname=djohn
pkgver=0.9.8.1
pkgrel=5
pkgdesc="Cracks passwords over multiple computers using john"
arch=('i686' 'x86_64')
url="http://ktulu.com.ar/blog/software/djohn/"
license=('GPL')
optdepends=('john: to actually crack passwords')
source=("http://downloads.sourceforge.net/sourceforge/djohn/${pkgname}-${pkgver}.tgz"
	"${pkgname}-${pkgver}.tgz.sig")
sha512sums=('78dfd22c4c64edcd69fe8be47fa3e6199bcd7c89a099225223a01e6865adb1f9a1e8fe2017174052cf39d76e6db6f76ed94fd9c2b8139e3568cf535b8f01781b'
            'SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # build
  make linux

  # install
  install -d ${pkgdir}/usr/bin/
  install -s -m 0755 djohn djohnd ${pkgdir}/usr/bin/
  ln -s djohnd ${pkgdir}/usr/bin/djs
}
