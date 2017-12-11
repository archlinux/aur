# Maintainer: Bennett Piater <bennett at piater dot name>
pkgname='yousician'
pkgver='0.1.145'
pkgrel=2
pkgdesc='Singstar-like teacher for guitar, piano, bass and ukulele'
arch=('x86_64')
url='http://yousician.com/'
license=('unknown')
depends=(clang libc++ libc++abi)
source=("https://d3mzlbmn9ukddk.cloudfront.net/Builds/Yousician.tar.gz" "$pkgname.desktop")
sha512sums=('05fd5f5365f82f1805d7c5d50cedc64ddbff1787f8cb3cf7bb4dea69748c80423bfab181e16a6f0cb9a05543effb4ca04cd59246cfe9d3d4e4b82ba3725ce38e'
            '48f6f4b195bcb4cd5e350290ac1fd98dcd4bf35842b11804fae44840f7b1fb374544e37601f2675b1fdf4c9cce8fc0ab53aa1d004d5e8c86d4a92faec916aa1e')


package() {
    mkdir -p "$pkgdir"/opt/yousician
    chmod 777 "$pkgdir"/opt/yousician

    install -Dm644 -t "$pkgdir"/usr/share/applications/ *.desktop

    cd "Yousician Launcher"
    cp "Yousician Launcher" version.txt "$pkgdir"/opt/yousician
}
