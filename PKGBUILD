# Maintainer: Mohsen Mohammadi <jmohsenm@gmail.com>
# Contributor: Soywod <https://github.com/soywod>

pkgbase=unfog-cli
pkgname=unfog-cli-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="A simple task & time manager written in Haskell"
arch=('any')
url="https://github.com/unfog-io/${pkgbase}"
license=('BSD')
depends=()
makedepends=()
source=("$pkgbase-$pkgver.tar.gz::https://github.com/unfog-io/$pkgbase/releases/download/v$pkgver/unfog-linux.tar.gz")
md5sums=('13b910f2408aad7650e3e460cdec3542')

package() {
	cd "$srcdir"
    _license=LICENSE
	curl -SLo $_license https://raw.githubusercontent.com/unfog-io/unfog-cli/master/$_license
	install -Dm644 $_license "$pkgdir/usr/share/licenses/$pkgbase/$_license"
	install -Dm755 unfog "$pkgdir/usr/bin/unfog"
	curl -sLo unfog-completion.bash "https://raw.githubusercontent.com/unfog-io/$pkgbase/master/bin/completion.bash"
	install -Dm644 unfog-completion.bash "$pkgdir/usr/share/bash-completion/completions/unfog"
}
