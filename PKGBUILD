# Maintainer: Matej Lach <me@matej-lach.me>

pkgname=dynafire-bin
pkgver=0.1
pkgrel=2
pkgdesc='Real-time threat detection for any Linux system running firewalld, based on real-time updates from the Turris Sentinel project'
arch=(x86_64)
url='https://github.com/MatejLach/dynafire'
license=(GPL3)
depends=('networkmanager' 'firewalld' 'zeromq')
source=("dynafire::https://github.com/MatejLach/dynafire/releases/download/v${pkgver}/dynafire"
        "dynafire.service")
sha256sums=("f4ea7cda7bfa77de7c476b1ef15cc3284f6a59188123f640e30726dcf0a4167c"
            "2e813ea127bdfa44112d356efb3fe7b03c8d0658e1bb06e7f566435c4ae5d6bb")
install=dynafire.install

package() {
    install -d "${pkgdir}/usr/bin"
    install -m 755 dynafire "${pkgdir}/usr/bin/"
    chmod +x "${pkgdir}/usr/bin/dynafire"

    install -Dm0644 dynafire.service "$pkgdir"/usr/lib/systemd/system/dynafire.service
}
