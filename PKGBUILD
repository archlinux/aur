# Maintainer: bohoomil <@zoho.com>

pkgname=otf-erewhon-ibx
pkgver=1.08
pkgrel=1
depends=('fontconfig')
pkgdesc="Erewhon is based on the Heuristica family, which is based in turn on Utopia. The size is 6% smaller than Heuristica, matching that of UtopiaStd."
url="http://www.ctan.org/tex-archive/fonts/erewhon"
arch=('any')
groups=('infinality-bundle-fonts-extra')
license=('custom:OFL')
source=(http://mirrors.ctan.org/fonts/erewhon.zip
        45-erewhon.conf
        90-non-tt-erewhon.conf)
sha1sums=('e93a1b90089e1b9d4545c34f5209a237f0991c64'
          '1648a48e6f02f7da610d6544eede2083fbc50cb9'
          '37c4c88d165b74896f59d940aaebb275253a5c0e')

package(){
  cd erewhon

  install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 doc/"OFL.txt" \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 opentype/*.otf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 ../45-erewhon.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-erewhon.conf
  install -m644 ../90-non-tt-erewhon.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-non-tt-erewhon.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-erewhon.conf .
  ln -s ../conf.avail/90-non-tt-erewhon.conf .
}
