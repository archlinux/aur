# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=clyrics
pkgver=0.16
pkgrel=1

pkgdesc="An extensible lyrics fetcher, with daemon support for cmus and mocp."
url="https://github.com/trizen/clyrics"

arch=('any')
license=('GPL3')

depends=('perl-www-mechanize' 'perl-io-html' 'perl-lwp-protocol-https')
optdepends=('moc: daemon support for moc player'
            'cmus: daemon support for cmus player')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('9fd413fbaa59600061d800bab5efc5c1f7e8f5656f7a18e5dc2c48a678c55419a7ad132c0e58d79d1d6b1cff4202e7530b505b32255353f99d284f4d7c9a388b')
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
