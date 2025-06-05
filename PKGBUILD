# Maintainer: Yash Lakhtariya <yashlakhtariya@outlook.com>
pkgname=download-guardian
pkgver=1.0.0
pkgrel=1
pkgdesc="User-level service that watches ~/Downloads and prompts to scan new files/folders with ClamAV"
arch=('x86_64')
url="https://yashlakhtariya.github.io"
license=('MIT')
depends=('inotify-tools' 'clamav' 'zenity' 'libnotify')
source=('download-guardian-scan.sh' 'download-guardian.service')
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "${srcdir}/download-guardian-scan.sh" "${pkgdir}/usr/bin/download-guardian-scan"
  install -Dm644 "${srcdir}/download-guardian.service" \
    "${pkgdir}/usr/lib/systemd/user/download-guardian.service"
}

