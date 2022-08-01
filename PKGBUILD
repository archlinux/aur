# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-dispense
pkgver=3.1.0
pkgrel=1
epoch=1
pkgdesc="Copy build products and reorganize them"
arch=('any')
url="https://github.com/mulle-sde/mulle-dispense"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=4.1.1')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-dispense/archive/3.1.0.tar.gz")
noextract=()
md5sums=('cc2ef15b9358c1b7dbe04fd6aee23a0e')
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
