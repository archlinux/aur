# Maintainer: Race D <git-noreply@mail.racedorsey.com>
# Contributor: gobonja <gobonja@gmail.com>

pkgname=timeshift-autosnap
pkgver=0.10.0
pkgrel=1
pkgdesc="Timeshift auto-snapshot script which runs before package upgrade using Pacman hook."
arch=("any")
url="https://codeberg.org/racehd/timeshift-autosnap"
license=('MIT')
depends=('timeshift')
optdepends=('grub-btrfs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
backup=('etc/timeshift-autosnap.conf')
b2sums=('ab7b3445b44973ee868d84049d13f010c481b331c4d6a23d31e085ae37a491a6d370b93f48abe3b17a18962ccbe92ef3ec65b613112348d13f9ca57e4339dfb1')

package() {
    cd ${srcdir}/${pkgname}
    install -Dm644 00-timeshift-autosnap.hook ${pkgdir}/usr/share/libalpm/hooks/00-timeshift-autosnap.hook
    install -Dm644 timeshift-autosnap.conf ${pkgdir}/etc/timeshift-autosnap.conf
    install -Dm755 timeshift-autosnap ${pkgdir}/usr/bin/timeshift-autosnap
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
