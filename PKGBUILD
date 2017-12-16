pkgname='lout-dejavu-git'
pkgdesc="AFM files and koi8-r mapping for DejaVu TrueType fonts(for Lout)"
pkgrel=1
pkgver=61b4690
arch=('any')
license=('GPL3')
depends=('lout' 'ttf-dejavu')
url="https://github.com/i-kuzmin/lout-dejavu"
source=("${pkgname}::git+${url}")
provides=(lout-dejavu)
sha256sums=('SKIP')

pkgver () {
  cd "$pkgname"
  git rev-parse --short HEAD
}

package () {
    install -d "${pkgdir}/usr/lib/lout"
    cp -r -t "${pkgdir}/usr/lib/lout"  "${pkgname}/"{data,font,include,maps}
}

# vim:set ts=2 sw=2 et:
