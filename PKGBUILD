# Maintainer: necklace <ns@nsz.no>

pkgname=iridium-rpm
pkgver=102.0
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

source=('https://downloads.iridiumbrowser.de/epel9/iridium-browser-2022.04.100.0-1.el9.x86_64.rpm')

sha256sums=('621921dfc5e353bc44c6d12797a2e5cd71b8caf1efade0a0f19f3362de89b0da')

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
    #ln -s "/usr/bin/iridium" "${pkgdir}/usr/bin/iridium-browser"
)
