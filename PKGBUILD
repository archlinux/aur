# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-daemon
pkgver=1.5.9
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('glibc')
source=("https://sia.tech/releases/siad/Sia-${_pkgver}-linux-amd64.zip"
	"https://gitlab.com/NebulousLabs/Sia/-/raw/master/LICENSE")
sha512sums=('4aa028ddbdcd6b37bbad9c5b63ac12210716985acda37d0dc45a22cf7d2f5d1597ce28387822630bb518daaaeb71101f1f85d830148dc75e6791f6c2adacbdc0'
            'f2eb222fff7fe71e37e2e60ed34630fbcf5464a8b05de415b346002f8b33b0a2735027649d595280f026801ba26978442b743abc54dc5451c7f8396979f5b1ae')

package() {
  cd $srcdir/Sia-$_pkgver-linux-amd64

  install -Dm755 siac "${pkgdir}/usr/bin/siac"
  install -Dm755 siad "${pkgdir}/usr/bin/siad"
  install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
