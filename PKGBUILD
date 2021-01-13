# Maintainer: Mike Boiko <mike@boiko.ca>

_pkgname=nextcloud-sync-cron
pkgname=$_pkgname-git
pkgver=r14.cf3fc63
pkgrel=1
pkgdesc='Script to run the Linux/Unix Nextcloud command line client in a cron job.'
url="https://github.com/qcif/nextcloud-sync-cron"
license=('MIT')
arch=('any')
depends=('curl')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${_pkgname}
  install -Dm 755 nextcloud-sync-cron.sh "${pkgdir}/usr/bin/nextcloud-sync-cron.sh"
}

# vim: ft=sh ts=2 sw=2 et
