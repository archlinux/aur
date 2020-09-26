# Maintainer: Trevor McKay <trs.mckay@gmail.com>
# Contributor: Trevor McKay <trs.mckay@gmail.com>
pkgname=fzf-open
pkgrel=1
pkgdesc="Use fzf to open files in appropriate applications (a la macOS Spotlight)"
arch=('any')
url="https://github.com/trmckay/fzf-open.git"
license=('GPL3')
depends=(fzf python)
makedepends=(git)
changelog=
sha256sums=('504514d2c8f5fe8bc47c51619e438c911f12b4b19019798bd477c5cae08e164c')
pkgver=0.3
source=("https://github.com/trmckay/fzf-open/releases/download/v$pkgver/fzf-open-$pkgver.tar.gz")

package() {
    cd $srcdir
    install -Dm 755 fzf-open ${pkgdir}/usr/bin/fzf-open
    install -d ${pkgdir}/usr/share/fzf-open/
    install -Dm 755 lopen.sh ${pkgdir}/usr/share/fzf-open
    install -Dm 644 fzf-open.py ${pkgdir}/usr/share/fzf-open
    install -Dm 666 config ${pkgdir}/usr/share/fzf-open/example_config
}
