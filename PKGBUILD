# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-sde
pkgver=0.45.0
pkgrel=1
epoch=1
pkgdesc="Cross-platform IDE for the command-line"
arch=('any')
url="https://github.com/mulle-sde/mulle-sde"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=3.3.0' 'mulle-craft>=0.18.3' 'mulle-dispense>=2.0.1' 'mulle-env>=3.3.2' 'mulle-fetch>=1.8.3' 'mulle-make>=0.15.0' 'mulle-match>=0.7.0' 'mulle-monitor>=0.9.1' 'mulle-platform>=0.4.2' 'mulle-sourcetree>=0.23.1' 'mulle-template>=0.0.3')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-sde/archive/0.45.0.tar.gz")
noextract=()
md5sums=('4bfeefa6d0ec0ccc3ece96d0d79a6d07')
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
    mkdir -p "lib/${pkgname}"
    mv libexec/* "lib/${pkgname}"
    rm -r libexec
}
