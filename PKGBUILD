# Contributor: bohoomil <@zoho.com>
# Maintainer: Jristz <prflr88 arro'a gmail puntocom>

pkgname=ttf-ddc-uchen
pkgver=1.000
pkgrel=1
depends=('fontconfig')
pkgdesc="DDC Uchen is a font designed by Chris Fynn for the Dzongkha Development Commission."
url="https://sites.google.com/site/chrisfynn2/home/fonts/ddc-uchen"
arch=('any')
provides=('ttf-ddc-uchen-ib')
conficts=('ttf-ddc-uchen-ib')
license=('custom:OFL')
source=(http://www.dzongkha.gov.bt/IT/download/fonts/DDC_Uchen.ttf
        40-ddc-uchen.conf
        90-tt-ddc-uchen.conf)
sha1sums=('82b6129f846419503a69e969fbd442949fa949ba'
          '0d6041afb31037dc71bb4085c58cb0e30ce6da3e'
          '0baa6a003a18c67305e06757587faa17dabfa997')

package(){

  install -m755 -d "${pkgdir}"/usr/share/fonts/TTF
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/

  install -D -m644 40-ddc-uchen.conf \
    "${pkgdir}"/etc/fonts/conf.avail/40-ddc-uchen.conf
  install -D -m644 90-tt-ddc-uchen.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-ddc-uchen.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/40-ddc-uchen.conf .
  ln -s ../conf.avail/90-tt-ddc-uchen.conf .
}
