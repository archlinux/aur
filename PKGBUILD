# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Marcos Heredia <chelqo@gmail.com>

_font=lobster-font
_group=impallari
_commit=ee431d49dcf5ab3d894214acd5b6dc93d80a63d5
pkgname=(ttf-$_group-$_font otf-$_group-$_font)
pkgver=2.1
pkgrel=1
pkgdesc="A lovely bold condensed script font, from Pablo Impallari"
arch=(any)
url='https://github.com/impallari/The-Lobster-Font'
license=(OFL-1.1-RFN)
groups=(${_group}-fonts)
source=("$_font-$pkgver.tar.gz::https://github.com/impallari/The-Lobster-Font/archive/ee431d49dcf5ab3d894214acd5b6dc93d80a63d5.tar.gz")
sha256sums=('79e06a4d4032ed5b69da5fc46a99ea4d844268524a6aa5ee9c66c114209f48c4')

package_ttf-impallari-lobster-font() {
  pkgdesc+=" (TTF)"
  cd ${srcdir}/The-Lobster-Font-$_commit

  install -vDm 644 fonts/ttf/*.ttf -t "$pkgdir"/usr/share/fonts/TTF/$_group
  install -vDm 644 OFL.txt -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 AUTHORS.txt CONTRIBUTING.md CONTRIBUTORS.txt \
    DESCRIPTION.en_us.html README.md -t "$pkgdir"/usr/share/doc/$pkgname
}

package_otf-impallari-lobster-font() {
  pkgdesc+=" (OTF)"
  cd ${srcdir}/The-Lobster-Font-$_commit

  install -vDm 644 fonts/otf/*.otf -t "$pkgdir"/usr/share/fonts/OTF/$_group
  install -vDm 644 OFL.txt -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 AUTHORS.txt CONTRIBUTING.md CONTRIBUTORS.txt \
    DESCRIPTION.en_us.html README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
