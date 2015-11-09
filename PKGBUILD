# Maintainer: Giancarlo Razzolinit <grazzolini@gmail.com>

pkgname=keepass-plugin-keeagent-beta
pkgver=0.7.11
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
source=('http://lechnology.com/wp-content/uploads/2015/11/KeeAgent_Beta_v0.7.11.zip' "$pkgname.install")
sha512sums=('89b836adcf59d65f0ab2d11fdf2df786a52e3113b10bd4ab9eed915c9b03cd024021b92d5c388f09ee1bc3befd872841bc5cdb42e10dcf748e41209196d8c729'
            'af3e0d450c82053f6564dee90f0c3a4f7f06fec1bc4061a6eb4811cc0f5ce764635529aea8501e71f8ca7b3f08d01d9c791975a22bc737def3517232d1efd92a')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 KeeAgent.plgx "${pkgdir}"/usr/share/keepass/plugins/
}
