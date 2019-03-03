# Maintainer: bohoomil <@zoho.com>

pkgver=4.301
pkgrel=1
pkgname=ttf-fira-sans-ibx
depends=(fontconfig)
pkgdesc="A sans-serif typeface designed for the Firefox OS."
url="https://www.mozilla.org/en-US/styleguide/products/firefox-os/typeface/"
arch=(any)
license=(Apache)
groups=(infinality-bundle-fonts-extra)
conflicts=(ttf-fira-sans otf-fira-sans otf-fira-sans-ibx)
replaces=(ttf-fira-sans)
provides=(ttf-fira-sans)
source=("https://bboxtype.com/downloads/Fira/Download_Folder_FiraSans_4301.zip"
        45-fira-sans.conf
        90-tt-fira-sans.conf)
sha256sums=('ff966173d53fc55cca9661fbdedb08a91a2f3984d5415b51cfb31c2bc4c18f19'
            'e03942ffc66b294b0a2a2b027482d9d73648c807c9281ecc4012bf5b36e43d61'
            '86df66781821f86f98e5a658ffd3bd5c74655bb5dae421f245c477704ddcae8c')

package_ttf-fira-sans-ibx() {
  cd "${srcdir}"//Download_Folder_FiraSans_4301/Fonts/Fira_Sans_TTF_4301
   find . -name "*.woff2" -type f -delete
   find . -name "*.eot" -type f -delete
   find . -name "*.woff" -type f -delete
   find . -name ".DS_Store" -type f -delete
   install -d -m755 "${pkgdir}"/usr/share/fonts/"${pkgname}"
   cp -r * "${pkgdir}"/usr/share/fonts/"${pkgname}"
  cd "${srcdir}"
  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 45-fira-sans.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-fira-sans.conf
  install -m644 90-tt-fira-sans.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-fira-sans.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/90-tt-fira-sans.conf .
  ln -s ../conf.avail/45-fira-sans.conf .
}

