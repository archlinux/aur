# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=clyrics
pkgver=0.17
pkgrel=1

pkgdesc="An extensible lyrics fetcher, with daemon support for cmus and mocp."
url="https://github.com/trizen/clyrics"

arch=('any')
license=('GPL-3.0-or-later')

depends=('perl-www-mechanize' 'perl-io-html' 'perl-lwp-protocol-https')
optdepends=('moc: daemon support for moc player'
            'cmus: daemon support for cmus player')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('130b622349e04bcb4b9f896fbc89f12c409e15b7e3777c4ca4747cba45582ffd5b753d18afed5757a4fce2929c3b34a5d39189fb6cdd87bcea4fc89bb0542048')
install='readme.install'

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    cd plugins
    for i in *
    do
        install -Dm644 "$i" "$pkgdir/usr/share/$pkgname/$i"
    done
}
