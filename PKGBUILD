# Maintainer: William Vigolo da Silva <wvigolodasilva@gmail.com>
_service=nftables
pkgname=nftables-openrc
pkgver=1
pkgrel=1
pkgdesc="OpenRC init scripts for nftables"
arch=('any')
url="https://gitweb.gentoo.org/repo/gentoo.git/tree/net-firewall/nftables"
license=('GPL2')
depends=('nftables' 'openrc')
backup=("etc/conf.d/$_service")
install="$pkgname.install"
source=("$_service.confd"
        "$_service.initd")
md5sums=('fb03adecedabb52a059479e3c912785f'
         '93bbfe082acb899ec1f4d8af1b6634e0')

package() {
    install -dm755 "$pkgdir/etc/init.d"
    install -dm755 "$pkgdir/etc/conf.d"
    install -Dm755 "$srcdir/$_service.initd" "$pkgdir/etc/init.d/$_service"
    install -Dm644 "$srcdir/$_service.confd" "$pkgdir/etc/conf.d/$_service"
}
