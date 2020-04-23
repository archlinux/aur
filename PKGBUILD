# Maintainer: goetzc
# Contributor: noonov
pkgname=lohit-fonts
pkgver=2.95.5.1
pkgrel=1
pkgdesc="Indic TrueType fonts from Fedora Project"
arch=('any')
url="https://pagure.io/lohit"
license=('custom: OFL')
depends=('fontconfig' 'xorg-font-utils')
_fhosted="https://releases.pagure.org/lohit/"
source=(OFL.license
  ${_fhosted}/lohit-assamese-ttf-2.91.5.tar.gz
  ${_fhosted}/lohit-bengali-ttf-2.91.5.tar.gz
  ${_fhosted}/lohit-devanagari-ttf-2.95.4.tar.gz
  ${_fhosted}/lohit-gujarati-ttf-2.92.4.tar.gz
  ${_fhosted}/lohit-gurmukhi-ttf-2.91.2.tar.gz
  ${_fhosted}/lohit-hindi-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-kannada-ttf-2.5.4.tar.gz
  ${_fhosted}/lohit-kashmiri-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-konkani-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-maithili-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-malayalam-ttf-2.92.2.tar.gz
  ${_fhosted}/lohit-marathi-ttf-2.94.2.tar.gz
  ${_fhosted}/lohit-nepali-ttf-2.94.2.tar.gz
  ${_fhosted}/lohit-oriya-ttf-2.5.4.1.tar.gz
  ${_fhosted}/lohit-odia-ttf-2.91.2.tar.gz
  ${_fhosted}/lohit-punjabi-ttf-2.5.3.tar.gz
  ${_fhosted}/lohit-sindhi-ttf-2.4.3.tar.gz
  ${_fhosted}/lohit-tamil-ttf-2.91.3.tar.gz
  ${_fhosted}/lohit-tamil-classical-ttf-2.5.4.tar.gz
  ${_fhosted}/lohit-telugu-ttf-2.5.5.tar.gz
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

sha256sums=('ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3'
            '3a8fe11c7160fcdbb779a64b31d05c958f7494a53600c154725c971f119a0208'
            '4067fde137504b673dfb04920cae0c927c39b9b0864eebe0d31a0d689762ac17'
            'e826ce0aa39e8b978ed73c0d419bc1f9f14392ac6f2672bcdb3fb39829614401'
            '069c226c5d3f1d70ef5e90c47a4d1f8fbddcc68d900b58527d0e3d43f64e660f'
            'e622c55b61441392c1aa800b8bedec523c02d000e7b6ca76e7d4cff9b63047d8'
            'd3132290a8e1a57bdebe26cbad87a68d450a79e064bf6e5c346ab5b8c74a0aa1'
            'ef2daed2d05d35809e63b63e6aa8715cfed0bfa1a09497953b5c2f33d0b3c884'
            'e93d906969eddfe7b99ebe2f6e4e38168baa99e58ace26b59527fc4bf6efa82b'
            '855cb6af1ad44cf0de367ba08b7064ef3d09a869a4e3fc9e52c02823fe11ec0f'
            '8a40dca49a9d8b301846982879bceac4e11ea1d27a0b77cedabb2a1b30b41c2b'
            '4b3337f2fb8094ff4e302f2452e1d0ca5987f1352309e835cbf65cbb62366e30'
            '8cad46c1caf982acd13646c8c6ce15fce620525504a54d0e6332834e488c96a3'
            '397d5e9317926d518eadd6d9dc9beee278a2d339206ee8a3d74248cea45c171e'
            '96cd1c0c2f13d286907235763b253a65589899ebd124defd6003e9ec9d9d8841'
            'dff79ccc1186663e103ececa6346acf739391da05f860cfa620534aa6c2955c0'
            'd14143d1cbb9d6a72385251875b5b903f95dfbfed9f69e93568f6ab6dfd557bd'
            'c14dc1f5f87ef04d5b1413276a4ce66a363b78d2b379df7e7982f900ec723502'
            'f2570dc3cee8f65850b0ac02ab00527f1eeb85cac7fde12a69cec4b00f7fc3f1'
            'e92b1d75308450732817b5f8fa2ede5e29a632e92d7c5025f2ecfde51c0cfb28'
            '71987ddcd7c407ee52d49784a30b41309d276d9b051a96c4a76580b73c6b03c0')
