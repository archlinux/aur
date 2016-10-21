# Maintainer: Giancarlo Razzolinit <grazzolini@gmail.com>

pkgname=keepass-plugin-keeagent
pkgver=0.8.1
pkgrel=3
pkgdesc="SSH Agent Plugin for KeePass"
license=('GPL')
depends=('keepass')
optdepends=('openssh: For integration with ssh-agent' 'gnupg: For integration with GnuPG SSH agent')
arch=('any')
url="http://lechnology.com/software/keeagent/"
DLAGENTS='http::/usr/bin/curl -fLC - --user-agent Firefox --retry 3 --retry-delay 3 -o %o %u'
#install=$pkgname.install
source=("${pkgname}-${pkgver}.zip::http://lechnology.com/wp-content/uploads/2016/07/KeeAgent_v0.8.1.zip")
sha512sums=('433341b7d2bd5de5f9d4dd81ee7347acd6e5ef43c979416db877e9b824179753d9cdca12294d72645ec559425bec549a381818f0795c6d77e8b06f5d00106dcd')

package() {
    install -Dm644 KeeAgent.plgx -t "$pkgdir/usr/share/keepass/plugins/"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 GPL2.txt "$pkgdir/usr/share/licenses/$pkgname/GPL2.txt"
    cp -r SshAgentLib.License "${pkgdir}/usr/share/licenses/$pkgname/"
}
