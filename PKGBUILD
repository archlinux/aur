# Maintainer: Tobias Burdow <kaleidox@comroid.org>

pkgname=rgx-git
pkgver=0.3
pkgrel=1
pkgdesc="Commandline RegExp Tool"
arch=('any')
url="https://git.comroid.org/comroid/rgx"
license=('GPL-3.0')
depends=('dotnet-runtime-7.0')
makedepends=('dotnet-sdk-7.0')
source=("git+https://git.comroid.org/comroid/rgx.git" "git+https://git.comroid.org/comroid/csapi.git")
md5sums=('SKIP' 'SKIP')
options+=("!strip")

build() {
    cd rgx
    dotnet publish -c Release --use-current-runtime
}

package() {
    install -Dm755 "rgx/rgx/bin/Release/net7.0/linux-x64/publish/rgx" "$pkgdir/usr/bin/rgx"
}
