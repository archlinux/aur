# Maintainer: Giancarlo Razzolinit <grazzolini@gmail.com>

pkgname=keepass-plugin-keeagent
pkgver=0.8.1
pkgrel=2
pkgdesc="SSH Agent Plugin for KeePass"
license=('GPL')
depends=('keepass')
optdepends=('openssh: For integration with ssh-agent' 'gnupg: For integration with GnuPG SSH agent')
provides=('keepass-plugin-keeagent')
conflicts=('keepass-plugin-keeagent-beta')
arch=('any')
url="http://lechnology.com/software/keeagent/"
DLAGENTS='http::/usr/bin/curl -fLC - --user-agent Firefox --retry 3 --retry-delay 3 -o %o %u'
install=$pkgname.install
source=("${pkgname}-${pkgver}.zip::http://lechnology.com/wp-content/uploads/2016/07/KeeAgent_v0.8.1.zip" "$pkgname.install")
sha512sums=('433341b7d2bd5de5f9d4dd81ee7347acd6e5ef43c979416db877e9b824179753d9cdca12294d72645ec559425bec549a381818f0795c6d77e8b06f5d00106dcd'
            'b7d249f9b60cc7d7c7a57dddbe5544d769b6fa6987636fc2816e7a1d1bcea0f38a6a8e9a2d26fca49227a7a51ecb25f7c501dceb7bb45ec367f7f739012301b6')

package() {
    install -Dm644 KeeAgent.plgx -t $pkgdir/usr/share/keepass/plugins/
    install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 GPL2.txt $pkgdir/usr/share/licenses/$pkgname/GPL2.txt
    cp -r SshAgentLib.License ${pkgdir}/usr/share/licenses/$pkgname/
}
