# Maintainer: bohoomil <@zoho.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=ttf-fira-mono-ibx
pkgver=3.2
pkgrel=2
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
source=(https://bboxtype.com/downloads/Fira/Fira_Mono_3_2.zip
        45-fira-mono.conf
        90-tt-fira-mono.conf)
sha256sums=('77b83feda1f1c5b8e8da07498aff6fa0f9d2d16bbfa2095dd7e7696c887c6128'
            '585bb85804a019b23a29770979c23a07026539129855b9ada5f8e2a9398b17d8'
            '4c73a779d5101baf25a5ea3a1327248a7ccbffaf873503563ebbd7f5bf9ae3fb')

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

