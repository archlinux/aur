# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-craft
pkgver=0.19.0
pkgrel=1
epoch=1
pkgdesc="Build projects using mulle-make and mulle-sourcetree"
arch=('any')
url="https://github.com/mulle-sde/mulle-craft"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=3.4.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-craft/archive/0.19.0.tar.gz")
noextract=()
md5sums=('1790f75e2ecf3d6658bc29708cb7487a')
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
