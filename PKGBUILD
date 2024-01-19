# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Sashanoraa <sasha@noraa.gay>

pkgname=yt-spammer-purge
pkgver=2.17.1
pkgrel=1
pkgdesc="A script that allows you to filter and search for spammer comments on your channel and other's channel(s)"
arch=('any')
url="https://github.com/ThioJoe/YT-Spammer-Purge"
license=('GPL3')
source=("yt-spammer-purge-${pkgver}.tar.gz::https://github.com/ThioJoe/YT-Spammer-Purge/archive/refs/tags/v${pkgver}.tar.gz"
    'yt-spammer-purge')
depends=('python' 'tk' 'python-google-api-python-client' 
    'python-google-auth-oauthlib' 'python-protobuf' 'python-colorama'
    'python-rtfunicode' 'python-certifi' 'python-six' 'python-levenshtein'
    'python-regex' 'python-rapidfuzz' 'python-numpy' 'python-setuptools')
sha256sums=('4128e5299823872613df10ef9c294d55aaca809ff8d67363b888052a56987d3c'
            'f3f6ace0928d0c5465c693a4300e03059c33d4c059409741169f5c5e9e5eeb86')
install=msg.install

package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/YT-Spammer-Purge-${pkgver}" "${pkgdir}/usr/share/${pkgname}"
    chmod a+w "${pkgdir}/usr/share/${pkgname}"
    install -Dm755 yt-spammer-purge "${pkgdir}/usr/bin/yt-spammer-purge"
}
