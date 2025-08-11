# Maintainer: ernest <307141632@qq.com>
pkgname=rwork
pkgver=7.18.16
pkgrel=1
arch=('x86_64')
url="https://rwork.crc.com.cn/gxlog/index.html"
license=('LicenseRef-rwork')
source=("https://rwork.crc.com.cn/download/Rwork3.0-linux_x64-${pkgver}.deb")
md5sums=('b0822c05864a74811aaf3d8d5ba78e8a')
options=('!strip' '!debug')
DLAGENTS=('https::/usr/bin/curl -A "Mozilla/5.0" -fLC - --retry 3 --retry-delay 3 -o %o %u')
prepare() {
    mv "Rwork3.0-linux_x64-${pkgver}.deb" "${pkgver}.deb"
    ar -x "${pkgver}.deb"
    mkdir -p "${pkgname}-${pkgver}"

    tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
}

package() {
    cd "$pkgname-$pkgver"
    cp -r ./ ${pkgdir}/
}
