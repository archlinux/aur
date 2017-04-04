# Mainainer: bohoomil <@zoho.com>

pkgname=ttf-roboto-mono-ibx
pkgver=2.0
pkgrel=4
pkgdesc="Monospace variant of the Google Roboto font family."
arch=('any')
license=('Apache')
url="http://code.google.com/android/"
depends=('fontconfig')
groups=('infinality-bundle-fonts-extra')
conflicts=('ttf-roboto-mono')
# http://www.google.com/fonts
# all scripts
source=(Roboto_Mono.zip::https://fonts.google.com/download?family=Roboto%20Mono
        45-roboto-mono.conf
        90-tt-roboto-mono.conf)
validgpgkeys=('A9244FB5E93F11F0E975337FAE6866C7962DDE58')
sha1sums=('cff45f40b590094eb0dcbc6359d1daabaee5069c'
          '022fa31ea75d8978aa8c5cf6c7efc5af2431b943'
          '272491d73a59e9d0ac8200c16e3b31657db58cf8')

package(){
  cd $srcdir/

  install -D -m644 "LICENSE.txt" \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -d -m755 "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  cd "${srcdir}"
  install -D -m644 45-roboto-mono.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-roboto-mono.conf
  install -D -m644 90-tt-roboto-mono.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-roboto-mono.conf

  install -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-roboto-mono.conf .
  ln -s ../conf.avail/90-tt-roboto-mono.conf .
}
