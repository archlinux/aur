# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=clyrics
pkgver=0.08
pkgrel=1

pkgdesc="An extensible lyrics fetcher, with daemon support for cmus and mocp."
url="https://github.com/trizen/clyrics"

arch=('any')
license=('GPL3')

depends=('perl-www-mechanize' 'perl-io-html' 'perl-lwp-protocol-https')
optdepends=('moc: daemon support for moc player'
            'cmus: daemon support for cmus player')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('23026f0e4929339c8a9b144631bdfb7f12135f2133420f992a023fa104aff2ef')
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
