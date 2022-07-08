# Maintainer: KirMozor <kirmozor96@gmail.com>
# Contributor: Archie <archie-woc@ya.ru>
pkgname=yamux
pkgver=v54
pkgrel=1
epoch=1
pkgdesc="This is a yandex music client for Linux written in C# with YandexMusicAPI"
arch=("x86_64")
url="https://gitlab.com/KirMozor/Yamux"
license=('GPL3')
depends=("libbass" "dotnet-runtime>=6.0.0")
makedepends=("dotnet-sdk>=6.0.0")
source=("https://gitlab.com/KirMozor/Yamux/-/archive/Yamux-v54/Yamux-Yamux-v54.tar.gz")
md5sums=(SKIP)
install=post.install

build() {
    cd Yamux-Yamux-$pkgver
    dotnet build --configuration Release
}

package() {
    cd Yamux-Yamux-$pkgver
    cp -r Svg ./bin/Release/net6.0/linux-x64
    mkdir -p $pkgdir/opt/
    cp -r ./bin/Release/net6.0/linux-x64/. $pkgdir/opt/Yamux
    # mkdir -p $pkgdir/usr/local/bin/Yamux
    # ln -sf $pkgdir/usr/local/bin/Yamux/Yamux $pkgdir/usr/bin/Yamux
    # cp ./bin/Release/net6.0/linux-x64/Yamux $pkgdir/usr/bin
    # chmod +x "$pkgdir/usr/bin/Yamux"
}
