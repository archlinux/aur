# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-sorts-mill-goudy-ibx
pkgver=3.1
pkgrel=9
depends=('fontconfig')
pkgdesc="A modern revival of Goudy Oldstyle and Italic"
url="http://crudfactory.com/"
arch=('any')
groups=('infinality-bundle-fonts-extra')
conflicts=('ttf-sortsmillgoudy' 'otf-sorts-mill-goudy-ibx')
license=('MIT')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/sortsmill/goudy-3.1.zip"
        45-sorts-mill-goudy.conf
        90-tt-sorts-mill-goudy.conf)
sha1sums=('6a4f2878c1dbd5a995351e555c02a66cc8decb74'
          '91ec08c2e735908fce86bf89380d82fa2c6bd666'
          'dfa5cb778431cd331b1539326eb7072acbc1dc55')

package(){
  install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 45-sorts-mill-goudy.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-sorts-mill-goudy.conf
  install -m644 90-tt-sorts-mill-goudy.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-sorts-mill-goudy.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-sorts-mill-goudy.conf .
  ln -s ../conf.avail/90-tt-sorts-mill-goudy.conf .
}
