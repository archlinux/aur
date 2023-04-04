# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-dispense
pkgver=3.2.0
pkgrel=1
epoch=1
pkgdesc="Copy build products and reorganize them"
arch=('any')
url="https://github.com/mulle-sde/mulle-dispense"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=5.0.3')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-dispense/archive/3.2.0.tar.gz")
noextract=()
md5sums=('bdaf222290b6c0609715f742f17ea9e9')
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
