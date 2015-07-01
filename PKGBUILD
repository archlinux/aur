# Contributor: Mark Lee <mark@markelee.com>
# Maintainer : Mark Lee <mark@markelee.com>

pkgname=zswap
pkgver=1.1
pkgrel=1
pkgdesc="Sets up zram-based swap devices on boot"
arch=('any')
url="https://github.com/bluerider/zswap.git"
license=('MIT')
depends=('bash' 'util-linux')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}";
  git checkout "$pkver";
  install -Dm755 "${srcdir}/${pkgname}/zswap.sh" "${pkgdir}/usr/lib/systemd/scripts/zswap.sh"
  install -Dm644 "${srcdir}/${pkgname}/zswap.service" "${pkgdir}/usr/lib/systemd/system/zswap.service"
}
