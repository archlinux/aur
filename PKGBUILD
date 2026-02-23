pkgname=caches-manager
pkgver=0.1.10
pkgrel=2
pkgdesc='A simple script that helps keep selected directories clean by symlinking or mounting to tmpfs ramdisk'
arch=('any')
url="https://github.com/HanabishiRecca/${pkgname}"
license=('MIT')
options=('!strip')

depends=('bash')

_snapshot="${pkgname}-${pkgver}"
source=("${url}/archive/${pkgver}/${_snapshot}.tar.gz")
sha256sums=('898e31a029cf635334f6d3a6cb8b216e13cfd472a0ba14250fe296b1d2f3dad6')

package() {
    cd "${_snapshot}"
    install -Dm755 'caches-manager' -t "${pkgdir}/usr/bin"
    install -Dm644 'systemd/system/caches-manager.service' -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 'systemd/user/caches-manager.service' -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 'config/system.conf.example' -t "${pkgdir}/etc/caches-manager/system"
    install -Dm644 'config/user.conf.example' -t "${pkgdir}/etc/caches-manager/user"
    install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
