# Maintainer: Yash Lakhtariya <yashlakhtariya@outlook.com>
pkgname=download-guardian
pkgver=1.1.0
pkgrel=1
pkgdesc="User-level lightweight service that watches ~/Downloads and prompts to scan new files/folders with Download Guardian (powered by ClamAV)"
arch=('x86_64')
url="https://github.com/yashlakhtariya/download-guardian"
license=('MIT')
depends=('inotify-tools' 'clamav' 'zenity' 'libnotify')
source=('download-guardian-scan.sh'
        'download-guardian.service'
        'download-guardian-reload.hook')
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 "${srcdir}/download-guardian-scan.sh" \
    "${pkgdir}/usr/bin/download-guardian-scan"

  install -Dm644 "${srcdir}/download-guardian.service" \
    "${pkgdir}/usr/lib/systemd/user/download-guardian.service"

  install -Dm644 "${srcdir}/download-guardian-reload.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/download-guardian-reload.hook"
}

