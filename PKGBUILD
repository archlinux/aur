# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-sde
pkgver=0.47.0
pkgrel=1
epoch=1
pkgdesc="Cross-platform IDE for the command-line"
arch=('any')
url="https://github.com/mulle-sde/mulle-sde"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=3.4.0' 'mulle-craft>=0.19.0' 'mulle-dispense>=2.0.2' 'mulle-env>=3.4.0' 'mulle-fetch>=2.0.0' 'mulle-make>=0.16.0' 'mulle-match>=0.8.0' 'mulle-monitor>=0.9.2' 'mulle-platform>=0.5.0' 'mulle-sourcetree>=0.25.0' 'mulle-template>=0.0.4')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-sde/archive/0.47.0.tar.gz")
noextract=()
md5sums=('4c3ef9c9526682a4dd301fca0e67cf3c')
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
