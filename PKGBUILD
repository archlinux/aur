# Maintainer: Mohsen Mohammadi <jmohsenm@gmail.com>
# Contributor: Soywod <https://github.com/soywod>

pkgbase=unfog-cli
pkgname=${pkgbase}-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="A simple task & time manager written in Haskell"
arch=('any')
url="https://github.com/soywod/unfog.cli"
license=('BSD')
depends=()
makedepends=()
source=("$pkgbase-$pkgver.tar.gz::$url/releases/download/v$pkgver/unfog-linux.tar.gz")
sha256sums=('49e9d5f4078b8c9fd38c5a254ff6fcfa62fa980808110684040cf66479112ac9')

package() {
    cd "$srcdir"
    _license=LICENSE
    curl -SLo $_license https://raw.githubusercontent.com/unfog-io/unfog-cli/master/$_license
    install -Dm644 $_license "$pkgdir/usr/share/licenses/$pkgbase/$_license"
    install -Dm755 unfog "$pkgdir/usr/bin/unfog"
    curl -sLo unfog-completion.bash "https://raw.githubusercontent.com/unfog-io/$pkgbase/master/bin/completion.bash"
    install -Dm644 unfog-completion.bash "$pkgdir/usr/share/bash-completion/completions/unfog"
}
