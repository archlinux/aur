# Maintainer: Olaf Leidinger <oleid@mescharet.de>
pkgname=rock-dkms
pkgver=3.1.35
_pkgver=3.1-35
pkgrel=1
pkgdesc="Linux AMD GPU kernel driver from ROC in DKMS format."
arch=('any')
url="https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver"
license=('GPL')
depends=('dkms>=1.95')
backup=('etc/modprobe.d/blacklist-radeon.conf')
options=('!strip' '!emptydirs')
source=("http://repo.radeon.com/rocm/apt/debian/pool/main/r/rock-dkms/rock-dkms_${_pkgver}_all.deb")
sha256sums=('21f6caf7ffc4ef29a6cde7353fd9e2d0fc97d9e9755c62bc6af7a736126925c2')

package() {
  cd "$srcdir"

  tar xf data.tar.xz -C "$pkgdir"
  install -Dm644 "$pkgdir/usr/share/doc/rock-dkms/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
