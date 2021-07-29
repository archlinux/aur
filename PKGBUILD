# Maintainer: necklace <ns@nsz.no>

pkgname=iridium-rpm
pkgver=91.0
pkgrel=3
pkgdesc='Iridium browser - rhel/centos build altered for arch'
arch=('x86_64')
url="https://iridiumbrowser.de/"
license=('BSD')
provides=('iridium')
conflicts=('iridium' 'chromium')
depends=('ffmpeg' 'pipewire' 're2')
options=('!emptydirs' '!strip')

source=('https://downloads.iridiumbrowser.de/openSUSE_Tumbleweed/x86_64/iridium-browser-2021.06.91-1.5.x86_64.rpm')

sha256sums=('a754e695eafaca782abaef0becdc97ff2ea30d022cd381073561aaf8afd2adec')

package() (
    mkdir -p "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/lib64/." "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/etc" "${pkgdir}/etc"
    ln -s "/usr/lib/libavcodec.so.58.134.100" "${pkgdir}/usr/lib/libavcodec.so.58.134"
    ln -s "/usr/lib/libavformat.so.58.76.100" "${pkgdir}/usr/lib/libavformat.so.58.76"
    ln -s "/usr/lib/libavutil.so.56.70.100" "${pkgdir}/usr/lib/libavutil.so.56.70"
)
