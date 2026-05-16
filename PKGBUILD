# Maintainer: Alexander Agura <agura.alex@gmail.com>
pkgname=smart-unlock
pkgver=0.1.4
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/agura-lex/smart-unlock"
license=('GPL-2.0')
depends=()
optdepends=('kdeconnect: kde_connect module'
            'bluez-utils: bluetooth module')
options=()
#install=
source=("https://github.com/agura-lex/smart-unlock/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('191fb2eb243735427306deff41469390800ebafd51b1bdf9d77ff516b8f65aec')


package() {
    cd "$pkgname-$pkgver"
    rm -f modules/README.md
    install -Dm755 smart-unlock.sh $pkgdir/usr/bin/smart-unlock

    install -Dm644 \
        modules/* \
        defaults.cnf \
        smart-unlock.cnf.sample \
        -t $pkgdir/usr/share/$pkgname

    install -Dm644 smart-unlock.service -t $pkgdir/usr/lib/systemd/user/
}
