# Maintainer: bohoomil <@zoho.com>

pkgver=4.203
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
source=("https://carrois.com/downloads/Fira/Fira_Sans_4_2.zip"
        45-fira-sans.conf
        90-tt-fira-sans.conf)
sha256sums=('e0b60ccaabf20481b145bd81286056d13ab705385b181ee80d3287e607b5b8a7'
            'e03942ffc66b294b0a2a2b027482d9d73648c807c9281ecc4012bf5b36e43d61'
            '86df66781821f86f98e5a658ffd3bd5c74655bb5dae421f245c477704ddcae8c')

package_ttf-fira-sans-ibx() {
  cd "${srcdir}"//Fira_Sans_4_2/Fonts/FiraSans_WEB_4203
   find . -name "*.woff2" -type f -delete
   find . -name "*.eot" -type f -delete
   find . -name "*.woff" -type f -delete
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

