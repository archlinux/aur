# Contributor: noonov <noonov@gmail.com>

pkgname=lohit-fonts
pkgver=2.95.1
pkgrel=1
pkgdesc="Indic TrueType fonts from Fedora Project"
arch=('any')
url="https://fedorahosted.org/lohit/"
license=('custom: OFL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_fhosted="https://fedorahosted.org/releases/l/o/lohit"
source=(OFL.license
  ${_fhosted}/lohit-assamese-ttf-2.91.1.tar.gz
  ${_fhosted}/lohit-bengali-ttf-2.91.1.tar.gz
  ${_fhosted}/lohit-devanagari-ttf-2.95.1.tar.gz
  ${_fhosted}/lohit-gujarati-ttf-2.92.2.tar.gz
  ${_fhosted}/lohit-gurmukhi-ttf-2.91.0.tar.gz
  ${_fhosted}/lohit-hindi-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-kannada-ttf-2.5.3.tar.gz
  ${_fhosted}/lohit-kashmiri-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-konkani-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-maithili-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-malayalam-ttf-2.92.0.tar.gz
  ${_fhosted}/lohit-marathi-ttf-2.94.0.tar.gz
  ${_fhosted}/lohit-nepali-ttf-2.94.0.tar.gz
  ${_fhosted}/lohit-oriya-ttf-2.5.3.tar.gz
  ${_fhosted}/lohit-odia-ttf-2.91.0.tar.gz
  ${_fhosted}/lohit-punjabi-ttf-2.5.3.tar.gz
  ${_fhosted}/lohit-sindhi-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-tamil-ttf-2.91.0.tar.gz
  ${_fhosted}/lohit-tamil-classical-ttf-2.5.3.tar.gz
  ${_fhosted}/lohit-telugu-ttf-2.5.3.tar.gz
)

package() {
  install -d "${pkgdir}"/usr/share/fonts/TTF
  install -d "${pkgdir}"/etc/fonts/{conf.avail,conf.d}

  install -m644 "${srcdir}"/*/*.conf "${pkgdir}/etc/fonts/conf.avail/"
  install -m644 "${srcdir}"/*/*.ttf  "${pkgdir}/usr/share/fonts/TTF/"

  cd "${pkgdir}/etc/fonts/conf.d"
  for config in ../conf.avail/*.conf; do
    ln -s ${config} .
  done

  install -D -m644 "${srcdir}/OFL.license" \
    "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
}

md5sums=('6ed93967ff0dc6dd9c8d31c17f817a06'
         'ca22ec5e42db06e8c43c74b988d0bf0d'
         'f8871fa3df4578234c5efb26c3d01311'
         '899bbafce9fa71cbb19b9687d354dcef'
         'a2a5c30c0b1a68d59ead3cf26ce88d0b'
         '2397138cb546b638adf33e8a32071e54'
         'dbfcfee6fd10045e523decb7657e4a75'
         'f38bec5fe7d0d850fd2cb4760f4e47ed'
         '442a84402d7a7db8a4d76a97aeb650db'
         'a9ddcde9f5a367063fc7db3eb075791c'
         '57420207e4560b1b3798fdd429d34724'
         '81fd6a485f2cb3ca5119b6ad58fc63fe'
         '42c852ba334635d7896d4566851a2ce9'
         'f4908b5ff918551fd2212cd55af67c08'
         '57bca2a52f411e1c2420482814806d85'
         '25078eb6efce26ecac77e19592860a38'
         'deab8c052af328248e8f619178ff890d'
         '8070d3e151e3ae0a9c3c05a25a38bc1f'
         '59febbb742c626096fa990077202f8f0'
         '8042f874e86a87623adaea4780f03b29'
         '4e0600fd5f26fe114314e8a050b51ba5')
