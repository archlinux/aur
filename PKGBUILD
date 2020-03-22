# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=mybase-desktop-bin
pkgver=735
pkgrel=1
pkgdesc='A high-quality free-form database program for personal note-taking and knowledgebase management'
arch=('x86_64')
url='http://www.wjjsoft.com'
license=('custom: commercial')
depends=('zlib' 'glibc' 'gcc-libs' 'libpng12')
provides=('mybase-desktop')
conflicts=('mybase-desktop')
source=(
    "http://www.wjjsoft.com/downloads/myBase-Desktop-Ver${pkgver}-Linux-amd64.tar.bz2"
    "myBase.desktop"
)
sha512sums=(
    '722d5fa9c1e4f3af7edbb4855776b2ec6f877df935aac154edeafb79e86d4edd98bb0eea07079f729df0f90db1862ad1904df4a590bd423222a3232e92f66a10'
    '75ee29c84a1648f9c76f94b73034f3d432658709e1b04b15d41111d7f892f371967803e34d60e06f96903ecc9b739972133589e1076c8e18aafc9a802f101765'
)

package() {
    install -d "${pkgdir}/usr/share/licenses/mybase-desktop"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons" 
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt"
    
    
    cp -r "${srcdir}/myBase7" "${pkgdir}/opt/"
    install -m644 "${srcdir}/myBase7/license.txt" "${pkgdir}/usr/share/licenses/mybase-desktop/LICENSE"
    install -m644 "${srcdir}/myBase7/images/ico_nyfdb.png" "${pkgdir}/usr/share/icons/myBase.png"
    install -m644 "${srcdir}/myBase.desktop" "${pkgdir}/usr/share/applications/myBase.desktop"
    ln -s /opt/myBase7/myBase.run "${pkgdir}/usr/bin/myBase"
}
