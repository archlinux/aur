# Maintainer: Sashanoraa <sasha@noraa.gay>

pkgname=yt-spammer-purge
pkgver=2.16.1
pkgrel=2
pkgdesc="A script that allows you to filter and search for spammer comments on your channel and other's channel(s)"
arch=('any')
url="https://github.com/ThioJoe/YT-Spammer-Purge"
license=('GPL-3.0')
source=("yt-spammer-purge-$pkgver.tar.gz::https://github.com/ThioJoe/YT-Spammer-Purge/archive/refs/tags/v$pkgver.tar.gz"
    'yt-spammer-purge')
depends=('python' 'tk' 'python-google-api-python-client' 
    'python-google-auth-oauthlib' 'python-protobuf' 'python-colorama'
    'python-rtfunicode' 'python-confusables' 'python-certifi' 'python-six'
    'python-levenshtein')
sha256sums=('e25ef681e544e12e5e3853303265bd8729936adbe5cfef1b8cf7f88f584c2680'
            'f3f6ace0928d0c5465c693a4300e03059c33d4c059409741169f5c5e9e5eeb86')
install=msg.install

package() {
    mkdir -p "$pkgdir/usr/share"
    cp -r "$srcdir/YT-Spammer-Purge-$pkgver" "$pkgdir/usr/share/$pkgname"
    chmod a+w "$pkgdir/usr/share/$pkgname"
    install -Dm755 yt-spammer-purge "$pkgdir/usr/bin/yt-spammer-purge"
}
