# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=clyrics
pkgver=0.14
pkgrel=1

pkgdesc="An extensible lyrics fetcher, with daemon support for cmus and mocp."
url="https://github.com/trizen/clyrics"

arch=('any')
license=('GPL3')

depends=('perl-www-mechanize' 'perl-io-html' 'perl-lwp-protocol-https')
optdepends=('moc: daemon support for moc player'
            'cmus: daemon support for cmus player')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('83b868096aa3927a6f0068af97952e7020a41a1f5d90dfcf3e240062b504cd4486b73941dc9f53d5da40a4842af50b4af40856be39757a0fb0312e4baf012836')
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
