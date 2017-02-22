# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=clyrics
pkgver=0.06
pkgrel=1

pkgdesc="An extensible lyrics fetcher, with daemon support for cmus and mocp."
url="http://github.com/trizen/clyrics"

arch=('any')
license=('GPL3')

depends=('perl-www-mechanize' 'perl-io-html' 'perl-lwp-protocol-https')
optdepends=('moc: daemon support for moc player'
            'cmus: daemon support for cmus player')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8e940dd5b03d2674382c30c02c6422cef35a861e7ef5ebafa87123b3eeafbe4c')
install='readme.install'

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    cd plugins
    for i in *
    do
        install -Dm644 "$i" "$pkgdir/usr/share/$pkgname/$i"
    done

    #cd '..'
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
