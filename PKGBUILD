# Maintainer: cyprien <ton-email>
pkgname=bashellit
pkgver=0.1.0
pkgrel=1
pkgdesc="A Bash editor to help you write bash-scripts better"
arch=('x86_64')
url="https://github.com/cbdefontenay/bashellit"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libnm' 'hicolor-icon-theme')
provides=('bashellit')
conflicts=('bashellit')

# On utilise le nouveau tag v-${pkgver}
source_x86_64=("${url}/releases/download/v-${pkgver}/bashellit_${pkgver}_amd64.deb")
sha256sums_x86_64=('c60c3bd924fbb46219cf14d8aeba637eaf9f3d61b335207466a8cbd4f41042ac')

prepare() {
  # Extraction simplifiée puisqu'on n'a qu'une archi
  bsdtar -xf "bashellit_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.*
}

package() {
    # Copy everything from usr/ to the package directory
    cp -r usr/ "$pkgdir/"

    # Ensure binary is executable
    chmod +x "$pkgdir/usr/bin/bashellit"

    # Optional: create lowercase symlink if needed (here same as original)
    # ln -sf bashellit "$pkgdir/usr/bin/bashellit"
}
