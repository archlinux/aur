# Maintainer: Hubert Hirtz <hubert.hirtz@laposte.net>

pkgname=ellidri
pkgver=2.2.0
pkgrel=1
pkgdesc='Your kawaii IRC server'
arch=('x86_64')
url="https://git.sr.ht/~taiite/ellidri"
license=('ISC')
depends=('openssl')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~taiite/ellidri/archive/${pkgver}.tar.gz")
sha512sums=('8f47717f216304fe61714f4e19c2c302ac80b7d1a694972d890c7fd5bcfcd6096ae3b8416898d28ac8c13855369a3e06fdf239a64e348fbc2ad8344fe2c70549')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cargo build --locked --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 target/release/ellidri "${pkgdir}/usr/bin/ellidri"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
