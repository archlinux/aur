# Maintainer: Pedro Veloso <pedro.n.veloso at gmail dot com>

pkgname=pidcat-git
pkgver=04.2017
pkgrel=1
pkgdesc="Pidcat is a colored logcat script with improved readability that only shows log entries for a specific Android package."
arch=('any')
url="https://github.com/JakeWharton/pidcat"
license=('Apache')
depends=('python2')

source=("git+$url.git" "pidcat.patch")
md5sums=('SKIP' "88dd654d600d8de4ff42174d042f0a77")

build() {
	patch -N ${srcdir}/pidcat/pidcat.py pidcat.patch 
}

package() {
  # Install license
  install -Dm644 ${srcdir}/pidcat/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt

  # Install run script
  install -Dm755 ${srcdir}/pidcat/pidcat.py ${pkgdir}/usr/bin/pidcat
}
