# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Maintainer: Alessio Sergi <asergi at archlinux dot us>
# Contributor: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>

pkgname='dropbox-uploader-git'
pkgver=0.15.r0.g4850de6
pkgrel=1
pkgdesc='A bash script to manage Dropbox from the CLI'
arch=('any')
url='https://github.com/andreafabrizi/Dropbox-Uploader'
license=('GPL3')
depends=('bash' 'curl')
makedepends=('git')
source=('git://github.com/andreafabrizi/Dropbox-Uploader.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/Dropbox-Uploader"
  git describe --long | sed -E -e 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

prepare() {
  cd "${srcdir}/Dropbox-Uploader"
  sed -i -e 's/dropbox_uploader.sh/dropbox_uploader/g' 'dropShell.sh'
}

package() {
  cd "${srcdir}/Dropbox-Uploader"
  install -Dm755 'dropbox_uploader.sh' "${pkgdir}/usr/bin/dropbox_uploader"
  install -Dm755 'dropShell.sh' "${pkgdir}/usr/bin/dropShell"
}
