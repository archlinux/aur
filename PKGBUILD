# Maintainer: Alexander Agura <agura.alex@gmail.com>
pkgname=smart-unlock
pkgver=0.1.6
pkgrel=1
pkgdesc="Auto session unlock daemon"
arch=('any')
url="https://github.com/agura-lex/smart-unlock"
license=('GPL-2.0')
depends=()
optdepends=('kdeconnect: kde_connect module'
            'bluez-utils: bluetooth module')
options=()
#install=
source=("https://github.com/agura-lex/smart-unlock/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('24a7a6dc7ac257ad8c978f2d024d1d8e373fc614bf9ac16c185137303588d2b6')


package() {
    cd "$pkgname-$pkgver"
    rm -f modules/README.md
    install -Dm755 smart-unlock.sh $pkgdir/usr/bin/smart-unlock
    install -Dm644 modules/* -t $pkgdir/usr/share/$pkgname/modules

    install -Dm644 \
        defaults.cnf \
        smart-unlock.cnf.sample \
        -t $pkgdir/usr/share/$pkgname

    install -Dm644 smart-unlock.service -t $pkgdir/usr/lib/systemd/user/
}
