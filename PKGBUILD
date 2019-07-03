# Maintainer: Shane <shanelyx@outlook.com>
pkgname=xmind-zen
pkgver=20190703
pkgrel=1
pkgdesc="XMind ZEN - The most popular mind mapping software. please modify the website to xmind.net for non-Chinese users"
arch=("x86_64")
url="https://www.xmind.cn/"
license=('custom')

conflicts=('xmind')

depends=('gconf'  'libxss' 'nss' 'libxtst')

_url="www.xmind.cn"
source=(
    "https://${_url}/xmind/downloads/XMind-ZEN-for-Linux-64bit.rpm"
    "https://${_url}/terms/index.html"
    "XMind.desktop"
    "XMind.png"
    "xmind.xml"
)

md5sums=(
    'fe6357e885b72400a597416ac3d0f314'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

package() {
    cd ${srcdir}
    cp -rf opt usr ${pkgdir}/
    
    # .desktop
    install -Dm644 XMind.desktop ${pkgdir}/usr/share/applications/

    # license
    install -Dm644 index.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
    
    # icon
    mkdir -p ${pkgdir}/usr/share/pixmaps
    install -Dm644 XMind.png ${pkgdir}/usr/share/pixmaps/
    
    # mimeType
    mkdir -p ${pkgdir}/usr/share/mime/packages
    install -Dm644 xmind.xml ${pkgdir}/usr/share/mime/packages/
}