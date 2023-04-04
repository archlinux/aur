# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-env
pkgver=4.2.0
pkgrel=1
epoch=1
pkgdesc="Virtual environment for Unix"
arch=('any')
url="https://github.com/mulle-sde/mulle-env"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=5.0.3')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-env/archive/4.2.0.tar.gz")
noextract=()
md5sums=('4b38e4652c8cf3d20b953d2af27d2fba')
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
