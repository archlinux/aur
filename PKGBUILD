# Author: mditto <michael.r.ditto@gmail.com>
# Maintainer: neothefox <soniczerops(at)gmail.com>

pkgname=paintstorm-bin
pkgver=2.43
pkgrel=1
pkgdesc="Professional software for digital painting"
arch=('x86_64')
url="http://www.paintstormstudio.com"
license=('Commercial')
depends=('gtk2' 'freeglut' 'ftgl' 'libcurl-gnutls'  'glew1.13')
source=("https://paintstormstudio.com/Paintstorm_linux_v${pkgver}.run.tar.gz")
sha256sums=('c94a7174666a04ad9329dfd7a3ed9963e49cacdfc4de4880b26d337767c9b84b')
provides=('paintstorm')
conflicts=('paintstorm')
install="${pkgname}.install"

package() {
    mkdir -p ${pkgdir}/usr/share/applications

    tar -xf "Paintstorm_linux_v${pkgver}.run.tar.gz" -C "${srcdir}"
    sh ${srcdir}/Paintstorm_linux_v${pkgver}.run --noexec

    #sed -i -e 's/usr\/share/opt/g' ${srcdir}/PaintstormInstall/paintstorm.desktop 
    mv ${srcdir}/PaintstormInstall/paintstorm ${pkgdir}/usr/share/paintstorm
    mv ${srcdir}/PaintstormInstall/paintstorm.desktop ${pkgdir}/usr/share/applications/paintstorm.desktop
}
