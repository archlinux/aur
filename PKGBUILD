# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname='rpmunpack'
pkgver='0'
pkgrel='3'
pkgdesc='This program converts rpm archives to cpio archives for cpio or afio'
arch=('i686' 'x86_64')
url='http://www.ibiblio.org/pub/Linux/utils/package'
license=('custom')
depends=('glibc')
source=("http://www.ibiblio.org/pub/Linux/utils/package/${pkgname}.tar.gz" 'LICENSE')
sha256sums=('4f2e97bdf5cecab2675c63d764b4cf403eb421f887e5abc1e6e41c4767b50ec8'
            'deef5b39f2fcdf1951851998107c52e2ae8b98a12289a339f9bf4cced24db0f1')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 'rpmunpack' "${pkgdir}/usr/bin/rpmunpack"
  install -Dm644 '../LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
