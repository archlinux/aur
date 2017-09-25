# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>
# Contributor: Vale Cofer-Shabica <vale.cofershabica@gmail.com>

pkgname=urw-classico
pkgver=1.0
pkgrel=3
pkgdesc='URW Classico font from CTAN (for texlive)'
arch=('any')
license=('CUSTOM:alladin')
url='https://www.ctan.org/tex-archive/fonts/urw/classico'
depends=('texlive-core')
install=$pkgname.install
source=('http://mirrors.ctan.org/install/fonts/urw/classico.tds.zip'
        'license')
noextract=('classico.tds.zip')
md5sums=('166eb8e7f2e1ca764b02e00aae5e86fb'
         '7689a58e80bcc8546b76e397b83a572b')

package() {
    cd "$srcdir"
    texmf_root=usr/share/texmf
    mkdir -p "$pkgdir/$texmf_root"
    bsdtar -poxf $srcdir/classico.tds.zip -C "$pkgdir/$texmf_root"
    install -Dm644 $srcdir/license "$pkgdir/usr/share/licenses/$pkgname/license"
}
