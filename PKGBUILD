# Maintainer: Giancarlo Razzolinit <grazzolini@gmail.com>

pkgname=keepass-plugin-keeagent-beta
pkgver=0.9.0
pkgrel=1
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
source=("${pkgname}-${pkgver}.zip::http://lechnology.com/wp-content/uploads/2017/01/KeeAgent_Beta_v0.9.0.zip")
sha512sums=('a7f41fb3867d474b0c4b3d2f9d58e05c783006c4a41ac148b77d55837ab9349de16c62e30455affd9a95ad5729b20388998e17964f950713bcf9d93fe5ff1299')

package() {
    install -Dm644 KeeAgent.plgx -t "$pkgdir/usr/share/keepass/plugins/"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 GPL2.txt "$pkgdir/usr/share/licenses/$pkgname/GPL2.txt"
    cp -r SshAgentLib.License "${pkgdir}/usr/share/licenses/$pkgname/"
}
