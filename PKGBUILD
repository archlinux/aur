# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-sde
pkgver=1.1.3
pkgrel=1
epoch=1
pkgdesc="Cross-platform IDE for the command-line"
arch=('any')
url="https://github.com/mulle-sde/mulle-sde"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=4.1.1' 'mulle-craft>=2.0.0' 'mulle-dispense>=3.1.0' 'mulle-domain>=1.0.1' 'mulle-env>=4.1.0' 'mulle-fetch>=3.0.1' 'mulle-make>=1.1.1' 'mulle-match>=1.0.1' 'mulle-monitor>=1.0.1' 'mulle-platform>=1.0.1' 'mulle-semver>=1.0.1' 'mulle-sourcetree>=1.1.0' 'mulle-template>=1.0.1' 'mulle-test>=6.1.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-sde/archive/1.1.3.tar.gz")
noextract=()
md5sums=('d2db7693ee98fff1a6c28db3406a76b2')
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
