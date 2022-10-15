# Maintainer: necklace <ns@nsz.no>

pkgname=iridium-rpm
pkgver=106.0
pkgrel=1
_folder='iridium-browser'
_name='iridium-browser'
pkgdesc='Iridium browser - rhel/centos build altered for arch'
arch=('x86_64')
url="https://iridiumbrowser.de/"
license=('BSD')
provides=('iridium')
conflicts=('iridium' 'chromium')
depends=('ffmpeg4.4' 'pipewire' 're2' 'snappy' 'minizip')
options=('!emptydirs' '!strip')
makedepends=('patchelf')

source=('https://downloads.iridiumbrowser.de/epel8/iridium-browser-2022.10.106-1.el8.x86_64.rpm')

sha256sums=('0f4c0e17e80853ee40592d27e8acf933077bcbf0273ddd93ef09a7ca315ee1da')

package() (
    mkdir -p "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/etc/iridium-browser"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/lib64/." "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/etc/iridium-browser" "${pkgdir}/etc/"
    #ln -s "/usr/lib/libavcodec.so.58.134.100" "${pkgdir}/usr/lib/libavcodec.so.58.134"
    #ln -s "/usr/lib/libavformat.so.58.76.100" "${pkgdir}/usr/lib/libavformat.so.58.76"
    #ln -s "/usr/lib/libavutil.so.56.70.100" "${pkgdir}/usr/lib/libavutil.so.56.70"
    ln -s "/usr/lib/libevent-2.1.so" "${pkgdir}/usr/lib/libevent-2.1.so.6"
    #patchelf "${pkgdir}/usr/lib/${_folder}/${_name}" --replace-needed "libavcodec.so.58.134" "libavcodec.so.58"
    #patchelf "${pkgdir}/usr/lib/${_folder}/${_name}" --replace-needed "libavformat.so.58.76" "libavformat.so.58"
    #patchelf "${pkgdir}/usr/lib/${_folder}/${_name}" --replace-needed "libavutil.so.56.70" "libavutil.so.56"
    ln -s "${pkgdir}/usr/bin/iridium-browser" "${pkgdir}/usr/bin/iridium"
)
