# Maintainer: Miloš Polakovič <milos@mailbox.org>
pkgname=timeglass-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='Automated time tracking for Git repositories'
arch=('x86_64')
url='https://github.com/timeglass/glass'
license=('MPL')
depends=('glibc')
optdepends=('git: kind of useless without it')
provides=('glass glass-daemon')

source=("https://github.com/timeglass/glass/releases/download/v0.6.0/linux_amd64_${pkgver}.zip"
        'timeglass.service')
md5sums=('2b6b29146c3b71cd480f7958c2c0e5b4'
         '04dc99adeea514e7a9cfb65aff20b79a')
package() {
    install -Dm0755 glass ${pkgdir}/usr/bin/glass
    install -Dm0755 glass-daemon ${pkgdir}/usr/bin/glass-daemon
    install -Dm0644 timeglass.service ${pkgdir}/usr/lib/systemd/system/timeglass.service
}
