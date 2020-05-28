# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-sansation-ibx
pkgver=1.31
pkgrel=5
depends=('fontconfig')
pkgdesc="A sans-serif typeface by Bernd Montag, perfect both for headings and paragraphs"
url="http://www.dafont.com/"
arch=('any')
groups=('infinality-bundle-fonts-extra')
conflicts=('ttf-sansation')
replaces=('ttf-sansation')
license=('custom:Freeware')
source=(sansation.zip::http://dl.dafont.com/dl/?f=sansation
        45-sansation.conf
        90-tt-sansation.conf)
sha256sums=('222d69bfa980e564b8990ce96923df1b38670c5e23c2044b374be2bf1a218b5d'
            '4113107cf2c2911001251eae92b4dd5e53d11396bcbcc883387070fcd5404e92'
            'fd95c922dd6a3e140fc318d7446bc2686e3177282ea291dd4d3d53af532d4d46')

package(){

  install -D -m644 "Sansation_1.31_ReadMe.txt" \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -D -m644 45-sansation.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-sansation.conf
  install -D -m644 90-tt-sansation.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-sansation.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-sansation.conf .
  ln -s ../conf.avail/90-tt-sansation.conf .
}
