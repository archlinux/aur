# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-sourcetree
pkgver=1.1.0
pkgrel=1
epoch=1
pkgdesc="Project composition and maintenance with build support"
arch=('any')
url="https://github.com/mulle-sde/mulle-sourcetree"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=4.1.1' 'mulle-env>=4.1.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-sourcetree/archive/1.1.0.tar.gz")
noextract=()
md5sums=('c0b6b01ab0a8a459c110ebc00ca6b56c')
validpgpkeys=()

package() {
    # Install License
    cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Run Install
    cd bin
    chmod +x installer
    ./installer "${pkgdir}/usr"

    # Move libexec to lib/$pkgname
    cd "${pkgdir}/usr"
    mkdir -p "lib/"
    mv libexec/* "lib/"
    rm -r libexec
}
