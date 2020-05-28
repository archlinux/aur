# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-pfennig-ibx
pkgver=20120410
pkgrel=5
_sub=8b5fa73ca4cf4cfa42d21b9f73f6060b
depends=('fontconfig')
pkgdesc="A humanist sans-serif font with support for Latin, Cyrillic, Greek and Hebrew"
url="http://openfontlibrary.org/"
arch=('any')
license=('custom:OFL')
groups=('infinality-bundle-fonts-extra')
source=("http://openfontlibrary.org/assets/downloads/pfennig/${_sub}/pfennig.zip"
        45-pfennig.conf
        90-tt-pfennig.conf)
sha1sums=('6aca5abbf1015497c83df9500992c0c8e151cb60'
          '792e6469cabb840a6b3958c7ea95ba778602ec51'
          'a4408672f1c650a3de2da3ff9e8b1bc67a73c39e')

package() {

  install -D -m644 OFL.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -d -m755 "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -D -m644 45-pfennig.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-pfennig.conf
  install -D -m644 90-tt-pfennig.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-pfennig.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-pfennig.conf .
  ln -s ../conf.avail/90-tt-pfennig.conf .
}

