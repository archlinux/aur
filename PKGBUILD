# Maintainer: Giancarlo Razzolinit <grazzolini@gmail.com>

pkgname=keepass-plugin-keeagent-beta
pkgver=0.7.12
pkgrel=3
pkgdesc="SSH Agent Plugin for KeePass - Beta Version"
license=('GPL')
depends=('keepass')
optdepends=('openssh: For integration with ssh-agent' 'gnupg: For integration with GnuPG SSH agent')
provides=('keepass-plugin-keeagent')
conflicts=('keepass-plugin-keeagent')
arch=('any')
url="http://lechnology.com/software/keeagent/"
DLAGENTS='http::/usr/bin/curl -fLC - --user-agent Firefox --retry 3 --retry-delay 3 -o %o %u'
install=$pkgname.install
source=("${pkgname}-${pkgver}.zip::http://lechnology.com/wp-content/uploads/2016/03/KeeAgent_Beta_v0.7.12.zip")
sha512sums=('feb61b941f2a7754e5f6912fb8deb71ad5642407fd925d1f6392eb0e2747e93c8d6443344e5fc492ef7e5075a23ff59cd2a8a172dde54c67b180713bc53b0883')

package() {
    install -Dm644 KeeAgent.plgx -t "$pkgdir/usr/share/keepass/plugins/"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 GPL2.txt "$pkgdir/usr/share/licenses/$pkgname/GPL2.txt"
    cp -r SshAgentLib.License "${pkgdir}/usr/share/licenses/$pkgname/"
}
