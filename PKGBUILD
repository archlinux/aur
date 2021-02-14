# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-craft
pkgver=0.18.3
pkgrel=2
epoch=1
pkgdesc="Build projects using mulle-make and mulle-sourcetree"
arch=('any')
url="https://github.com/mulle-sde/mulle-craft"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=3.3.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-craft/archive/0.18.3.tar.gz")
noextract=()
md5sums=('086124ed9295f51057eee29459859e22')
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
