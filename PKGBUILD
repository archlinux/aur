pkgname=mybase-desktop-bin
pkgver=8216
pkgrel=1
pkgdesc='A high-quality free-form database program for personal note-taking and knowledgebase management'
arch=('x86_64')
url='http://www.wjjsoft.com'
license=('custom: commercial')
depends=()
provides=('mybase-desktop')
conflicts=('mybase-desktop')
source=(
    "http://www.wjjsoft.com/downloads/Mybase-Desktop-Ver${pkgver}-Linux-amd64.tar.xz"
    "Mybase8.desktop"
)
sha512sums=('8595d08dd3a16601cb5a4325176d2ee8d8776fa90f352abaab59c2afd31cb54c19705f85d7c752f3e1dc3dade544395acb8172532e6d62665c9917f56a4df412'
            'ae55b128ab75c47a2897f1ff29ee118d5e4bbdd24e5e998a065bd31c7f42d815fc364d7b3007a6c26f006fa5bee204bdc5164cb5e638ce4ddb2c3096c7fc8a01')

package() {
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons" 
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt"

    cp -r "${srcdir}/Mybase8" "${pkgdir}/opt/"
    install -m644 "${srcdir}/Mybase8/nyf8_logo_256.png" "${pkgdir}/usr/share/icons/Mybase8.png"
    install -m644 "${srcdir}/Mybase8.desktop" "${pkgdir}/usr/share/applications/Mybase8.desktop"
    ln -s /opt/MyBase8/Mybase.run "${pkgdir}/usr/bin/Mybase8"
}
