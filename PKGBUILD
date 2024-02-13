# Maintainer:  glatavento <glatavento  at outlook dot com>
# Contributor: sukanka    <su975853527 at gmail   dot com>

pkgname=siyuan-note-bin
_pkgname=siyuan-note
pkgver=2.12.8
pkgrel=1
pkgdesc="A local-first personal knowledge management system"
arch=('x86_64')
url="https://b3log.org/siyuan/"
license=('AGPL3')
depends=(electron28)
optdepends=('pandoc: docx export.')
provides=($_pkgname)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/siyuan-note/siyuan/releases/download/v${pkgver}/siyuan-${pkgver}-linux.tar.gz"
"$_pkgname.sh"
"$_pkgname.desktop")
sha512sums=('d821a0e62a65db3df2ff9ac0b12004ac572356f5ce2cb9da5524c5a46c5155800019882c9c58dee28537c0d7a82a9f08e377d979d6f433c735ad323cdca1a276'
            'ae1f84d9b36e42fc4d374f7adb1191b9158a3633b4a0e5d6dbf4bc2e6a0db499b23d7b2fff2a760e4751e4de5bbc8ac33df13958a153df5e2d67de303f9916d6'
            '4ca7d777c2dce64d89a874af268773009ba0ebe064c3ce0034913c447666bf6636a3c81d1145579fe1b0b6a35195b1f97b1b4cd56b50e990fb0642c4aae281f0')

package() {
    cd $srcdir 
    install -Dm755 ${_pkgname}.sh  ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 ${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
    
    cd $srcdir/siyuan-${pkgver}-linux
    install -Dm644 resources/stage/icon.png  ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png
    mkdir -p ${pkgdir}/usr/lib
    mv resources ${pkgdir}/usr/lib/${_pkgname}
}
# vim: ts=2 sw=2 et:
