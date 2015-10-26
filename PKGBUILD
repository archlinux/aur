# Maintainer: Giancarlo Razzolinit <grazzolini@gmail.com>

pkgname=keepass-plugin-keeagent-beta
pkgver=0.7.8
pkgrel=1
pkgdesc="SSH Agent Plugin for KeePass - Beta Version"
license=('BSD')
depends=('keepass')
optdepends=('openssh: For integration with ssh-agent' 'gnupg: For integration with GnuPG SSH agent')
provides=('keepass-plugin-keeagent-beta')
conflicts=('keepass-plugin-keeagent')
arch=('any')
url="http://lechnology.com/software/keeagent/"
DLAGENTS='http::/usr/bin/curl -fLC - --user-agent Firefox --retry 3 --retry-delay 3 -o %o %u'
install=$pkgname.install
source=('http://lechnology.com/wp-content/uploads/2015/10/KeeAgent_Beta_v0.7.8.zip' "$pkgname.install")
sha512sums=('527c76de28a4d854cf352476f25ad41134866b1ec5f1e5352f5f76d4af983323ed612071a5b86932e975bb3172c13d28d5a8c63163496461f54fd6164e23b1ac'
            'af3e0d450c82053f6564dee90f0c3a4f7f06fec1bc4061a6eb4811cc0f5ce764635529aea8501e71f8ca7b3f08d01d9c791975a22bc737def3517232d1efd92a')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 KeeAgent.plgx "${pkgdir}"/usr/share/keepass/plugins/
}
