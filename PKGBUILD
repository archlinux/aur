# Maintainer: Alice S. <quarkyalice@disroot.org>
pkgname=notifyupdates-git
pkgver=r3.764c564
pkgrel=1
pkgdesc="Notify you every 5 hours when there's updates available Arch Linux"
arch=('any')
url="https://github.com/alicela1n/notifyupdates-arch.git"
license=('GPL')
depends=('libnotify')

source=("${pkgname}::git+${url}")

sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -dm755 "${srcdir}/${pkgname%-git}/notifyupdates" "${pkgdir}/usr/bin/"
    install -dm755 "${srcdir}/${pkgname%-git}/notifyupdates.service" "${pkgdir}/usr/lib/systemd/user/"
    install -dm755 "${srcdir}/${pkgname%-git}/notifyupdates.timer" "${pkgdir}/usr/lib/systemd/user/"
}
