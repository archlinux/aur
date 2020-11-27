pkgname=solokey-full-disk-encryption
pkgver=r39.ee0359d
pkgrel=1
pkgdesc='Use SoloKey to unlock a LUKS partition'
arch=('any')
url='https://github.com/saravanan30erd/solokey-full-disk-encryption'
license=('Apache')
depends=('fido2luks' 'cryptsetup')
makedepends=('git')
backup=('etc/skfde.conf')
source=('git+https://github.com/saravanan30erd/solokey-full-disk-encryption.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
