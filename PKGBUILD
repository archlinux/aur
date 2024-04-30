# Maintainer: John Iannandrea <github.com/isivisi>

pkgname='vcvrack-questionablemodules-bin'
pkgver=2.1.14
pkgrel=2
pkgdesc="Questionable Modules for VCVRack"
url='https://github.com/isivisi/questionablemodules'
license=(GPL)
arch=(x86_64)
groups=()
depends=(vcvrack)
makedepends=()

pkgver() {
    curl -s https://api.github.com/repos/isivisi/questionablemodules/tags | jq -r '.[0].name' | sed -r 's/v//g' | sed -r 's/doc//g'
}

source=(
    "https://github.com/isivisi/questionablemodules/releases/download/v$pkgver/questionablemodules-$pkgver-lin-x64.vcvplugin"
)
sha256sums=(
    SKIP
)

package() {
	cp ./*.vcvplugin ~/.local/share/Rack2/plugins-lin-x64/
}