# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-test
pkgver=6.2.0
pkgrel=1
epoch=1
pkgdesc="Runs tests and compares results against expectations"
arch=('any')
url="https://github.com/mulle-sde/mulle-test"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=5.0.3' 'mulle-make>=2.0.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-test/archive/6.2.0.tar.gz")
noextract=()
md5sums=('5f5b7378cf032c9d42920a4c14a4a651')
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
