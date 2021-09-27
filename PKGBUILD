# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-daemon
pkgver=1.5.7
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('glibc')
source=("https://sia.tech/releases/Sia-${_pkgver}-linux-amd64.zip"
	"https://gitlab.com/NebulousLabs/Sia/-/raw/master/LICENSE")
sha512sums=('9f0eb70aa8f1e7dc2aa0ba24834ce321f44eec17cf60cdeb205794f33fa0d15837d744db24363fb3060fff90e7c5a2ab3f59d0981338d899724f6293500fa4cf'
            'f2eb222fff7fe71e37e2e60ed34630fbcf5464a8b05de415b346002f8b33b0a2735027649d595280f026801ba26978442b743abc54dc5451c7f8396979f5b1ae')

package() {
  cd $srcdir/Sia-$_pkgver-linux-amd64

  install -Dm755 siac "${pkgdir}/usr/bin/siac"
  install -Dm755 siad "${pkgdir}/usr/bin/siad"
  install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
