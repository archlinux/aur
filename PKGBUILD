# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=pegh
pkgver=0.9.4
pkgrel=1
pkgdesc="pegh is a file encryption tool using passwords with modern, standardized, and authenticated encryption."
url="https://github.com/moparisthebest/pegh"
depends=('openssl')
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
license=('AGPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/moparisthebest/pegh/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://github.com/moparisthebest/pegh/releases/download/v$pkgver/v$pkgver.tar.gz.asc"
       )
validpgpkeys=('81F1C22DD41109D4A9C0A7B5B070F8D97D1A0BBA') # moparisthebest <admin AT moparisthebest.com>
sha256sums=('0fa27afc89984e581507d4c6f30be4bee35ecc59b399551e894bdc0f3dd976f7'
            '8dce5119068e71fea03db8d0c19cc7665fcb5cc37a04d8f109c00387d1c2bc78'
           )

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 pegh "$pkgdir/usr/bin/pegh"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
