# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-craft
pkgver=3.0.0
pkgrel=1
epoch=1
pkgdesc="Build projects using mulle-make and mulle-sourcetree"
arch=('any')
url="https://github.com/mulle-sde/mulle-craft"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=5.0.3' 'mulle-dispense>=3.2.0' 'mulle-make>=2.0.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-craft/archive/3.0.0.tar.gz")
noextract=()
md5sums=('97735d44a96ddf94de8a8d2ded96b87a')
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
