# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-sde
pkgver=2.0.0
pkgrel=1
epoch=1
pkgdesc="Cross-platform IDE for the command-line"
arch=('any')
url="https://github.com/mulle-sde/mulle-sde"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=5.0.3' 'mulle-craft>=3.0.0' 'mulle-dispense>=3.2.0' 'mulle-domain>=1.1.0' 'mulle-env>=4.2.0' 'mulle-fetch>=3.1.0' 'mulle-make>=2.0.0' 'mulle-match>=1.0.3' 'mulle-monitor>=1.0.2' 'mulle-platform>=1.0.2' 'mulle-semver>=1.0.2' 'mulle-sourcetree>=1.2.0' 'mulle-template>=1.0.2' 'mulle-test>=6.2.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-sde/archive/2.0.0.tar.gz")
noextract=()
md5sums=('ce88fc20e0bf2b45176a4216505cedf1')
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
