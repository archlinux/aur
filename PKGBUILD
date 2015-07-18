# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname='testssl.sh-git'
pkgver=v2.4.r126.gcbbe7d8
pkgrel=1
pkgdesc="Testing TLS/SSL encryption (git version)"
arch=('any')
url="https://github.com/drwetter/testssl.sh"
license=("GPL")
depends=('bash' 'coreutils' 'util-linux' 'openssl')
makedepends=('git')
conflicts=('testssl.sh')
provides=('testssl.sh')
source=("${pkgname}::git+https://github.com/drwetter/${pkgname/-git/}.git")
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"

  install -D -m755 "testssl.sh" "${pkgdir}/usr/bin/testssl.sh"
}
