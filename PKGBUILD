# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-monitor
pkgver=1.0.2
pkgrel=1
epoch=1
pkgdesc="‍ Extensible filesystem observation with callbacks"
arch=('any')
url="https://github.com/mulle-sde/mulle-monitor"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=5.0.3' 'mulle-craft>=3.0.0' 'mulle-match>=1.0.3')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-monitor/archive/1.0.2.tar.gz")
noextract=()
md5sums=('e3e982fdd34090feb1540c6c24303859')
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
