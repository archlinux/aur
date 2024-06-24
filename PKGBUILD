# Contributor: lynix <lynix47@gmail.com>

pkgname=checkrun.sh-git
pkgver=1.4.r0.g494e19f
pkgrel=1
epoch=1
pkgdesc="Cron-style mailing wrapper for systemd .timer units"
url="https://github.com/lynix/checkrun.sh"
arch=('any')
license=('MIT')
depends=('bash' 'coreutils' 'which')
optdepends=('smtp-forwarder: to send mail notifications')
makedepends=('git')
conflicts=( 'checkrun.sh' )
provides=('checkrun.sh')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
