# Maintainer: bohoomil <@zoho.com>

pkgname=ttf-fira-mono-ibx
pkgver=3.2
pkgrel=1
epoch=1
depends=(fontconfig)
pkgdesc="A monospace typeface designed for the Firefox OS."
url="https://www.mozilla.org/en-US/styleguide/products/firefox-os/typeface/"
arch=(any)
license=(Apache)
groups=(infinality-bundle-fonts-extra)
conflicts=(ttf-fira-mono otf-fira-mono otf-fira-mono-ibx)
provides=(ttf-fira-mono)
replaces=(ttf-fira-mono)
source=(https://carrois.com/downloads/Fira/Fira_Mono_3_2.zip
        45-fira-mono.conf
        90-tt-fira-mono.conf)
sha1sums=('2f73b50ef1a36b2415b4d94f137d3b12bd2f92b5'
          'd8a085a8e70c28f405dc3ed0d60a5d44d045c86c'
          'b2970ffff80f13bb73ae05e1d9e858aa016aa6ad')

package() {

  cd "${srcdir}"/Fira_Mono_3_2/Fonts/FiraMono_WEB_32/
  install -d -m755 "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 FiraMono-*.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  cd "${srcdir}"
  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 45-fira-mono.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-fira-mono.conf
  install -m644 90-tt-fira-mono.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-fira-mono.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/90-tt-fira-mono.conf .
  ln -s ../conf.avail/45-fira-mono.conf .
}

