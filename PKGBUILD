# Maintainer: Tobias Burdow <kaleidox@comroid.org>

pkgname=iopipe-git
pkgver=0.1
pkgrel=1
pkgdesc="IO Pipeline Utility"
arch=('any')
url="https://github.com/comroid-git/iopipe"
license=('Apache License, Version 2.0')
depends=('dotnet-runtime-9.0')
makedepends=('dotnet-sdk-9.0')
source=("git+https://github.com/comroid-git/iopipe.git")
md5sums=('SKIP')
options+=("!strip")

build() {
    cd iopipe
    dotnet publish -c Release --use-current-runtime
}

package() {
    install -Dm755 "iopipe/iopipe/bin/Release/net6.0/linux-x64/publish/iopipe" "$pkgdir/usr/bin/iopipe"
}
