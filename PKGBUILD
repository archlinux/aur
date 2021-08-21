# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-make
pkgver=0.16.0
pkgrel=1
epoch=1
pkgdesc="Build projects with tools like cmake, meson, autoconf"
arch=('any')
url="https://github.com/mulle-sde/mulle-make"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=3.4.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-make/archive/0.16.0.tar.gz")
noextract=()
md5sums=('05d09aa487f8a992b786077e0091ab86')
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
