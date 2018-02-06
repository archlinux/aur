# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=DayJournal
pkgname=dayjournal-bin
_pkgname=dayjournal
pkgver=23.0.8
pkgrel=1
pkgdesc="A minimalistic digital journal that lets the content you create outlast DayJournal itself"
arch=('any')
url="https://burnsoftware.wordpress.com/dayjournal/"
license=('GPL3')
depends=('gdk-pixbuf2' 'libgee' 'glib2' 'gtk3' 'libnotify' 'pango')
provides=('dayjournal')
conflicts=('dayjournal')

source=("https://iballwasrawt.ru/dayjournal/dayjournal_$pkgver-1_amd64.deb"
        'https://iballwasrawt.ru/dayjournal/dayjournal.png'
        'https://iballwasrawt.ru/dayjournal/dayjournal.desktop')
sha256sums=('d39c27fd6d4463144807fadeaeb1c2c1328a4acc77a8c8a8fa955b62bd42eb46'
            '901d182afa6c838077cb163edb80d1e76e23f3bdd9f436797d82a7f7560ac664'
            '1c2e09afd5fc1c6b5ac4b1fd807b1827462a89d824f0c09f5689b8a81dee294a')

package() {
  tar -xJf data.tar.xz ./usr/bin/dayjournal
  
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 
  
  install -m755 "${srcdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
# vim:set ts=2 sw=2 et:
