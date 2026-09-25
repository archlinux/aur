pkgname=datafetch
pkgver=3.0.1
pkgrel=1
pkgdesc="Live system information dashboard for Linux terminals"
arch=('any')
url="https://github.com/KlodCripta/Datafetch"
license=('MIT')
depends=('bash>=4.3' 'coreutils' 'gawk' 'glibc' 'procps-ng')
optdepends=(
    'util-linux: detailed CPU model and topology'
    'pciutils: additional GPU information from lspci'
    'hwdata: PCI device names'
    'libdrm: AMD GPU model names'
)

# Pin the stable 3.0.1 source while an upstream version tag is unavailable.
_commit=cc2c08ba3ff14434f93e0077a5750d1f30b93d6d
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('c6bc542243a52fbe84ffe1d90f84d8babfa4cbee610ef4d2794c9184dc655b24')

package() {
    cd "$srcdir/Datafetch-$_commit"
    install -Dm755 datafetch.sh "$pkgdir/usr/bin/datafetch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
