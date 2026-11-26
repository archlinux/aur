# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=miladazad-fonts
pkgver=0.0.3
pkgrel=1
_commit=59f634ef38e23a060ab441f4212b949a13132394
pkgdesc="Persian/Arabic display font"
url="https://github.com/font-store/font-MiladAzad"
arch=('any')
license=('OFL-1.1')
provides=('miladazad')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('fcb8da29cd052a0a4a9726b269bd0395ccae2374686da6ef99c0de9bc57c0c83')

package() {
  cd "${srcdir}/font-MiladAzad-${_commit}"

  find dist -name '*.ttf' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/TTF/" \;

  find dist -name '*.woff2' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/woff2/" \;

  install -Dm644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 OFL.txt \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
