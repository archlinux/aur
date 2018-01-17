# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-cpma
pkgver=1.50
pkgrel=1
pkgdesc="Challenge ProMode Arena (CPMA) is a Quake3 modification which adds features aimed towards professional gamers and competitive enviroments."
url="http://playmorepromode.org/"
license=('custom')
arch=('any')
depends=('quake3')
source=('quake3-cpma.launcher' 'https://playmorepromode.org/files/latest/cpma-1.50-nomaps.zip')
sha256sums=('436f0545efc0edaaf5aad884dfe103e13363f25be276471b6c57c8932575e245'
            'bf3211ed1e37c0cf284e5579b5a2203a06310b4d8beb34c2104fbf613c3ace7f')
PKGEXT='.pkg.tar'

package() {
    # Base CPMA Files
    install -d "${pkgdir}/opt/quake3/"
    mv "${srcdir}/cpma" "${pkgdir}/opt/quake3/"

    # Install Launcher
    install -D -m 755 "${srcdir}/quake3-cpma.launcher" \
        "${pkgdir}/usr/bin/quake3-cpma"
}
