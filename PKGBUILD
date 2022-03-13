# Maintainer: David Cohen <dacohen@pm.me>
# Contributor: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=ukpdate-git
pkgver=0.r116.7350200
pkgrel=1
pkgdesc="UEFI Unified Kernel Image manager tool"
arch=('any')
url="https://github.com/osimarr/ukpdate"
license=('GPL3')
install=ukpdate.install
depends=('bash>=4.4' 'systemd' 'binutils' 'sbsigntools')
makedepends=('git')
conflicts=('sbupdate' 'ukpdate')
provides=('ukpdate')
backup=('etc/ukpdate.conf')
source=("git+https://github.com/osimarr/ukpdate.git?signed")
validpgpkeys=('96F281C741F4F2693E96885BF6532C30466E8B3E',
              '9CE1B36F586373C8A5DD89E447EDFD24F02ADC29')
sha256sums=('SKIP')

pkgver() {
  cd ukpdate
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ukpdate
  make DESTDIR="${pkgdir}" DOCDIR="/usr/share/doc/${pkgname}" install
}

# vim:set ts=2 sw=2 et:
