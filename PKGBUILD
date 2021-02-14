# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-dispense
pkgver=2.0.1
pkgrel=2
epoch=1
pkgdesc="Copy build products and reorganize them"
arch=('any')
url="https://github.com/mulle-sde/mulle-dispense"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=3.3.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-dispense/archive/2.0.1.tar.gz")
noextract=()
md5sums=('fedbd94f28dcb4542393493d9dbc5446')
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
