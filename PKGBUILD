# Maintainer: necklace <ns@nsz.no>

pkgname=iridium-rpm
pkgver=96.0
pkgrel=1
pkgdesc='Iridium browser - rhel/centos build altered for arch'
arch=('x86_64')
url="https://iridiumbrowser.de/"
license=('BSD')
provides=('iridium')
conflicts=('iridium' 'chromium')
depends=('ffmpeg' 'pipewire' 're2' 'snappy' 'minizip')
options=('!emptydirs' '!strip')

source=('https://downloads.iridiumbrowser.de/openSUSE_Leap_15.3/iridium-browser-2021.12.96.0-bp153.1636.1.x86_64.rpm')

sha256sums=('d288a2b650fc35d649720948bc875650dc8c43e06a196602be9c8a375b4fd07a')

package() (
    mkdir -p "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/etc/iridium-browser"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/lib64/." "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/etc/iridium-browser" "${pkgdir}/etc/"
    ln -s "/usr/lib/libevent-2.1.so" "${pkgdir}/usr/lib/libevent-2.1.so.6"
    ln -s "/usr/lib/libavcodec.so.58.134.100" "${pkgdir}/usr/lib/libavcodec.so.58.134"
    ln -s "/usr/lib/libavformat.so.58.76.100" "${pkgdir}/usr/lib/libavformat.so.58.76"
    ln -s "/usr/lib/libavutil.so.56.70.100" "${pkgdir}/usr/lib/libavutil.so.56.70"
    ln -s "/usr/bin/iridium" "${pkgdir}/usr/bin/iridium-browser"
)
