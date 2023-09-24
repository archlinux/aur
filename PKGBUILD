# Maintainer: jdigi78 <jdigiovanni78@gmail.com>

pkgname=rcedit-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='Command line tool to edit resources of exe files.'
arch=('any')
url='https://github.com/electron/rcedit/'
license=('MIT')
depends=('wine')
source=("https://github.com/electron/rcedit/releases/download/v${pkgver}/rcedit-x64.exe"
	'rcedit')
sha256sums=('02e8e8c5d430d8b768980f517b62d7792d690982b9ba0f7e04163cbc1a6e7915'
            '9c32c0930c2f7c1635854696845d20cb2d421582a45cd72f60c2da4332c86b2b')
            
installdir="/opt/rcedit"

package() {
    install -dm755 "${pkgdir}"/usr/bin/
    install -dm755 "${pkgdir}${installdir}"
    
    install -Dm755 "${srcdir}/rcedit-x64.exe" "${pkgdir}${installdir}/rcedit-x64.exe"
    install -Dm755 "${srcdir}/rcedit" "${pkgdir}${installdir}/rcedit"
    
    ln -s "${installdir}/rcedit" "${pkgdir}/usr/bin/rcedit"
}
