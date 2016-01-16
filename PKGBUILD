# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-cpma
pkgver=1.48
pkgrel=1
pkgdesc="Challenge ProMode Arena (CPMA) is a Quake3 modification which adds features aimed towards professional gamers and competitive enviroments."
url="http://playmorepromode.org/"
license=('custom')
arch=('any')
depends=('quake3')
source=('quake3-cpma.launcher' 'http://playmorepromode.org/CPMA148.zip')
sha256sums=('436f0545efc0edaaf5aad884dfe103e13363f25be276471b6c57c8932575e245'
            '83e7acb9f5597a4a9d9b35bbddbdbacfc3943c5a710b7a2b48c2318d1253c9de')
PKGEXT='.pkg.tar'

package() {
    # Base CPMA Files
    install -d "${pkgdir}/opt/quake3/"
    mv "${srcdir}/"{baseq3,cpma} "${pkgdir}/opt/quake3/"

    # Install Launcher
    install -D -m 755 "${srcdir}/quake3-cpma.launcher" \
        "${pkgdir}/usr/bin/quake3-cpma"
}
