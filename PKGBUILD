# Maintainer: Mohsen Mohammadi <jmohsenm@gmail.com>
# Contributor: Soywod <https://github.com/soywod>

pkgbase=unfog-cli
pkgname=${pkgbase}-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple task & time manager written in Haskell"
arch=('any')
url="https://github.com/soywod/unfog"
license=('BSD')
depends=()
makedepends=()
source=("$pkgbase-$pkgver.tar.gz::$url/releases/download/v$pkgver/unfog-linux.tar.gz")
sha256sums=('f1f1990bf1e4298c96da933605085f95fdeb7dac3dcca820f26d4661329bc58d')

package() {
    cd "$srcdir"
    _license=LICENSE
    curl -SLo $_license https://raw.githubusercontent.com/unfog-io/unfog-cli/master/$_license
    install -Dm644 $_license "$pkgdir/usr/share/licenses/$pkgbase/$_license"
    install -Dm755 unfog "$pkgdir/usr/bin/unfog"
    curl -sLo unfog-completion.bash "https://raw.githubusercontent.com/unfog-io/$pkgbase/master/bin/completion.bash"
    install -Dm644 unfog-completion.bash "$pkgdir/usr/share/bash-completion/completions/unfog"
}
