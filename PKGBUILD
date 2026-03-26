# Maintainer: Gergely HORVÁTH <horvathg dot 1988 at gmail dot com>

pkgname=ganttdown-bin
pkgver=20260212
pkgrel=1.0
pkgdesc="Gantt chart generator from markdown"
arch=('x86_64')
url="https://github.com/sev101/ganttdown"
license=('MIT')  # Adjust if different
depends=()       # Add runtime deps if required
makedepends=()
provides=('ganttdown')
conflicts=('ganttdown')
source=("ganntdown-linux-amd64::https://github.com/sev101/ganttdown/releases/latest/download/ganttdown-linux-amd64")
sha256sums=('ca3446f4a9627e7d39dd952ad945288556377cb21b89333298e9f9a950080f4e')

prepare() {
    chmod u+x "${srcdir}/ganntdown-linux-amd64"
}

package() {
    install -Dm755 "${srcdir}/ganntdown-linux-amd64" "${pkgdir}/opt/${pkgname}/ganttdown"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/ganttdown" "${pkgdir}/usr/bin/ganttdown"
  }
