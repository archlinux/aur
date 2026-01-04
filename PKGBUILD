_pkgname=typomat
pkgname="$_pkgname"-bin
pkgver=0.1.3
pkgrel=2
pkgdesc="Turn your code into muscle memory"
arch=('x86_64' 'aarch64')
url="https://github.com/vupdivup/typomat"
license=('MIT')
depends=()
makedepends=()
__source_archive="$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux"
source_x86_64=("${__source_archive}_amd64.tar.gz")
source_aarch64=("${__source_archive}_arm64.tar.gz")
sha256sums_x86_64=('17c3753323c3a2167e439f6a60c2df7e37d761c192d008f92d6751ad132591df')
sha256sums_aarch64=('da3ced27a4baef9e36f324ec775a25680f5cf2b50068bdc8373fc3f3be6f9a21')

package() {
    cd "$srcdir"

    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/_$pkgname/LICENSE"
}
