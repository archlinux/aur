# Maintainer: goetzc
# Contributor: noonov
pkgname=lohit-fonts
pkgver=2.95.3
pkgrel=1
pkgdesc="Indic TrueType fonts from Fedora Project"
arch=('any')
url="https://pagure.io/lohit"
license=('custom: OFL')
depends=('fontconfig' 'xorg-font-utils')
_fhosted="https://releases.pagure.org/lohit/"
source=(OFL.license
  ${_fhosted}/lohit-assamese-ttf-2.91.4.tar.gz
  ${_fhosted}/lohit-bengali-ttf-2.91.4.tar.gz
  ${_fhosted}/lohit-devanagari-ttf-2.95.3.tar.gz
  ${_fhosted}/lohit-gujarati-ttf-2.92.3.tar.gz
  ${_fhosted}/lohit-gurmukhi-ttf-2.91.1.tar.gz
  ${_fhosted}/lohit-hindi-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-kannada-ttf-2.5.3.tar.gz
  ${_fhosted}/lohit-kashmiri-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-konkani-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-maithili-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-malayalam-ttf-2.92.1.tar.gz
  ${_fhosted}/lohit-marathi-ttf-2.94.1.tar.gz
  ${_fhosted}/lohit-nepali-ttf-2.94.1.tar.gz
  ${_fhosted}/lohit-oriya-ttf-2.5.4.1.tar.gz
  ${_fhosted}/lohit-odia-ttf-2.91.1.tar.gz
  ${_fhosted}/lohit-punjabi-ttf-2.5.3.tar.gz
  ${_fhosted}/lohit-sindhi-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-tamil-ttf-2.91.2.tar.gz
  ${_fhosted}/lohit-tamil-classical-ttf-2.5.3.tar.gz
  ${_fhosted}/lohit-telugu-ttf-2.5.4.tar.gz
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
         'd1f256caaf72b69e29be814a94e7fc1e'
         '12519175868acaf2bafa78bd31aa837d'
         '0e81e0043cb89514f87b002b360cf4ba'
         '85ae1a7e85e78f6f1eef5c1540449cd1'
         '4eedab7139a05cca9b212664a84a6efb'
         'dbfcfee6fd10045e523decb7657e4a75'
         'f38bec5fe7d0d850fd2cb4760f4e47ed'
         '442a84402d7a7db8a4d76a97aeb650db'
         'a9ddcde9f5a367063fc7db3eb075791c'
         '57420207e4560b1b3798fdd429d34724'
         '75326cccc4ad58553220da33bbf08582'
         'ba71c3c72b623e935cea02350dd52d4f'
         '5008e4dc978eea59d01e929913cde670'
         'e79cd61631e2e8f70372a44859bc8d9b'
         '6d66ae4228893950ac73b2d04fb05602'
         'deab8c052af328248e8f619178ff890d'
         '8070d3e151e3ae0a9c3c05a25a38bc1f'
         '4ff784c14d2f42354160c30019b87acd'
         '8042f874e86a87623adaea4780f03b29'
         '0d9ec6fd82ad4a6951f5e40600c76181')
