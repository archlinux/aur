# Maintainer: Tobias Burdow <kaleidox@comroid.org>

pkgname=rgx-git
pkgver=0.1
pkgrel=2
pkgdesc="CLI RegExp Tool"
arch=('any')
url="https://github.com/comroid-git/rgx"
license=('MIT')
depends=('dotnet-runtime-6.0')
makedepends=('dotnet-sdk-6.0')
source=("git+https://github.com/comroid-git/rgx.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/rgx"
    dotnet publish -c Release --sc --use-current-runtime -p:PublishSingleFile=true -o publish
}

package() {
    install -Dm755 "$srcdir/rgx/bin/Release/net6.0/linux-x64/rgx" "$pkgdir/usr/bin/rgx"
}
