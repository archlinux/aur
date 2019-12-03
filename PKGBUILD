# Maintainer: alpha0x00 <li_tking@163.com>

pkgname=xmind-zen
# the versin is from deb package
pkgver=10.0.0
pkgrel=1
pkgdesc="XMind ZEN - The most popular mind mapping software"
arch=("x86_64")
url="https://www.xmind.net/"
license=('custom')
depends=('libxss' 'nss' 'libxtst' 'alsa-lib' 'gtk')

source=("https://dl2.xmind.cn/XMind-ZEN-for-Linux-amd-64bit-$pkgver-201911260056.deb"
        'xmind.xml')

sha256sums=('6c8283e23d9d57d3eb3b8f3bddf8208d99e6c6ecffe537e69293027bd0c56ed0'
            '833f6f1a7ddd73ea2487a21390e16b57c3fa817a560f385a034efdd1ed754a8d')

package() {
    tar xf data.tar.xz -C ${pkgdir}/

    chmod 755 /opt/XMind ZEN/ /opt/XMind ZEN/locales/ /opt/XMind ZEN/resources/

    mkdir -p ${pkgdir}/usr/bin/
    ln -s "/opt/XMind ZEN/XMind" ${pkgdir}/usr/bin/xmind-zen

    mkdir -p ${pkgdir}/usr/share/mime/packages
    install -Dm644 xmind.xml ${pkgdir}/usr/share/mime/packages/

    mkdir -p ${pkgdir}/usr/share/licenses/xmind-zen
    cp ${pkgdir}"/opt/XMind ZEN/resources/app.asar.unpacked/static/license/"license{-cn,}.pdf ${pkgdir}/usr/share/licenses/xmind-zen/
}
