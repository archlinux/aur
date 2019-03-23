# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='tablet-mode'
_upstream_name='tablet-switch'
pkgver=1.0.1
pkgrel=1
pkgdesc='Tools to toggle a convertible laptop between laptop and tablet mode'
arch=('any')
url="https://github.com/coNQP/${_upstream_name}"
license=('GPLv3')
depends=('bash' 'libnotify' 'python' 'sudo' 'systemd')
makedepends=('git')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${_upstream_name}"
    install -Dm 755 tablet-mode "${pkgdir}/usr/bin/tablet-mode"
    install -Dm 755 toggle-tablet-mode "${pkgdir}/usr/bin/toggle-tablet-mode"
    install -dm 755 "${pkgdir}/etc"
    install -dm 750 "${pkgdir}/etc/sudoers.d"
    install -m 640 tablet-mode.sudoers "${pkgdir}/etc/sudoers.d/tablet-mode"
    install -Dm 644 tablet-mode.service "${pkgdir}/usr/lib/systemd/system/tablet-mode.service"
    install -Dm 644 tablet-mode.group "${pkgdir}/usr/lib/sysusers.d/tablet-mode.conf"
    install -Dm 644 tablet-mode.desktop "${pkgdir}/usr/share/applications/tablet-mode.desktop"
}
