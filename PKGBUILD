# Maintainer: Tobias Burdow <kaleidox@comroid.org>

pkgname=clmath-git
pkgver=0.1
pkgrel=1
pkgdesc="Commandline Math Tool and Calculator"
arch=('any')
url="https://github.com/comroid-git/clmath"
license=('MIT')
depends=('dotnet-runtime-6.0')
makedepends=('dotnet-sdk-6.0')
source=("git+https://github.com/comroid-git/clmath.git" "git+https://github.com/comroid-git/csapi.git")
md5sums=('SKIP' 'SKIP')
options+=("!strip")

build() {
    cd clmath
    dotnet publish -c Release --use-current-runtime
}

package() {
    install -Dm755 "clmath/clmath/bin/Release/net6.0/linux-x64/publish/clmath" "$pkgdir/usr/bin/clmath"
}
