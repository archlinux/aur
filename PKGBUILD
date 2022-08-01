# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-test
pkgver=6.1.0
pkgrel=1
epoch=1
pkgdesc="Runs tests and compares results against expectations"
arch=('any')
url="https://github.com/mulle-sde/mulle-test"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=4.1.1' 'mulle-make>=1.1.1')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-test/archive/6.1.0.tar.gz")
noextract=()
md5sums=('6e1692b116ae1646f6afa2be9448c8a6')
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
