pkgname=kumono-bin
pkgver=0.68.1
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('04da54bccebda35d203a4c29b7baf116d3d849befed5bdb64c5e344ea2dc1dbb')
sha256sums_x86_64=('978f89c86d7a6bb3cdd2cb17c985e1ab1afc697d0601e6cd475b31df01477020')
sha256sums_aarch64=('e1c15b9e176700256d14a200d6c4acb8c3277f586607b8132f564e73b1fd5e3c')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
