# Maintainer: bohoomil <@zoho.com>
# Contributor: julroy67 <julroy67@gmail.com>

pkgname=ttf-noto-fonts-ib
_pkgcr=ttf-noto-fonts-cros-ib
_pkgsa=ttf-noto-fonts-sans-ib
_pkgse=ttf-noto-fonts-serif-ib
_pkgmo=ttf-noto-fonts-mono-ib
_pkgver=2017-02-27
_commit=84be0261e4a97cbdc315eff6e6648dd91300629f
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc="Google Noto TTF fonts"
url="http://www.google.com/get/noto/"
arch=(any)
groups=(infinality-bundle-fonts)
depends=(fontconfig)
conflicts=(ttf-noto ttf-noto-svn ttf-google-webfonts-git noto-fonts ttf-croscore-fonts-ibx ttf-noto-sans-ib ttf-noto-serif-ib)
replaces=(ttf-croscore-fonts-ibx ttf-noto-sans-ib ttf-noto-serif-ib)
provides=(noto-fonts ttf-font)
license=(custom:OFL)
source=("https://github.com/googlei18n/noto-fonts/archive/$_commit.zip"
	40-noto-arabic.conf
	45-noto-cros.conf
	45-noto-sans.conf
	45-noto-serif.conf
	45-noto-mono.conf
	90-tt-noto-cros.conf
	90-tt-noto-sans.conf
	90-tt-noto-serif.conf
	90-tt-noto-mono.conf)
sha256sums=('dbb4b52a3334a2391eb57263490085493301bc18b87ce086890e2f48a8b4a281'
            '734f20f62e6938601fe874c5af5994cd2e728e80bb121c08e1db8f084888e0ca'
            '3071752f837bca04c03d29f88a419c4a72682b91559353c7e26588c31a590572'
            'cb2fd6c63d1295fe73a15144b22178bed8a7471a603f6c45a86b0738b3565d6b'
            '39e6b5d115fbf0a63876f4890996d57693d8f6c64f93207c163bc5b6e38bc0b3'
            '0a620443b25dc481bdf10b2955ae0a5fdf92982a47e6f8236fb1db92485a6134'
            '974262f68a88905569a0685a4cd45d34882e348a1355e23f43e6c76dd38aa032'
            '16c8a798a3f87e098ee5a20a6a34d63de84db3e2886d8d40a33f88a59fa6c80e'
            'c3d526822a4787a2841f08859c3d1009d68ca97620a7d602ff855d2ff8f257ba'
            '17ec868a487b079dd94b68afbf3e23c2c00db426922d08f836684070dac9e5e5')

package() {
  cd noto-fonts-*
  cd hinted

  # Arimo, Cousine, Tinos
  _cr=(Arimo-Bold.ttf Arimo-BoldItalic.ttf Arimo-Italic.ttf Arimo-Regular.ttf Cousine-Bold.ttf Cousine-BoldItalic.ttf Cousine-Italic.ttf Cousine-Regular.ttf Tinos-Bold.ttf Tinos-BoldItalic.ttf Tinos-Italic.ttf Tinos-Regular.ttf)

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${_pkgcr}"

  for fnt in "${_cr[@]}"; do
    install -m644 "$fnt" "${pkgdir}"/usr/share/fonts/"${_pkgcr}"
  done

  # Noto Sans
  _sans=(NotoKufiArabic-Bold.ttf NotoKufiArabic-Regular.ttf NotoNaskhArabic-Bold.ttf NotoNaskhArabic-Regular.ttf NotoNaskhArabicUI-Bold.ttf NotoNaskhArabicUI-Regular.ttf NotoSans-Bold.ttf NotoSans-BoldItalic.ttf NotoSans-Italic.ttf NotoSans-Regular.ttf NotoSansArmenian-Bold.ttf NotoSansArmenian-Regular.ttf NotoSansBengali-Bold.ttf NotoSansBengali-Regular.ttf NotoSansBengaliUI-Bold.ttf NotoSansBengaliUI-Regular.ttf NotoSansDevanagari-Bold.ttf NotoSansDevanagari-Regular.ttf NotoSansDevanagariUI-Bold.ttf NotoSansDevanagariUI-Regular.ttf NotoSansEthiopic-Bold.ttf NotoSansEthiopic-Regular.ttf NotoSansGeorgian-Bold.ttf NotoSansGeorgian-Regular.ttf NotoSansGujarati-Bold.ttf NotoSansGujarati-Regular.ttf NotoSansGujaratiUI-Bold.ttf NotoSansGujaratiUI-Regular.ttf NotoSansGurmukhi-Bold.ttf NotoSansGurmukhi-Regular.ttf NotoSansGurmukhiUI-Bold.ttf NotoSansGurmukhiUI-Regular.ttf NotoSansHebrew-Bold.ttf NotoSansHebrew-Regular.ttf NotoSansKannada-Bold.ttf NotoSansKannada-Regular.ttf NotoSansKannadaUI-Bold.ttf NotoSansKannadaUI-Regular.ttf NotoSansKhmer-Bold.ttf NotoSansKhmer-Regular.ttf NotoSansKhmerUI-Bold.ttf NotoSansKhmerUI-Regular.ttf NotoSansLao-Bold.ttf NotoSansLao-Regular.ttf NotoSansLaoUI-Bold.ttf NotoSansLaoUI-Regular.ttf NotoSansMalayalam-Bold.ttf NotoSansMalayalam-Regular.ttf NotoSansMalayalamUI-Bold.ttf NotoSansMalayalamUI-Regular.ttf NotoSansMyanmar-Bold.ttf NotoSansMyanmar-Regular.ttf NotoSansMyanmarUI-Bold.ttf NotoSansMyanmarUI-Regular.ttf NotoSansOriya-Bold.ttf NotoSansOriya-Regular.ttf NotoSansOriyaUI-Bold.ttf NotoSansOriyaUI-Regular.ttf NotoSansSinhala-Bold.ttf NotoSansSinhala-Regular.ttf NotoSansTamil-Bold.ttf NotoSansTamil-Regular.ttf NotoSansTamilUI-Bold.ttf NotoSansTamilUI-Regular.ttf NotoSansTelugu-Bold.ttf NotoSansTelugu-Regular.ttf NotoSansTeluguUI-Bold.ttf NotoSansTeluguUI-Regular.ttf NotoSansThaana-Bold.ttf NotoSansThaana-Regular.ttf NotoSansThai-Bold.ttf NotoSansThai-Regular.ttf NotoSansThaiUI-Bold.ttf NotoSansThaiUI-Regular.ttf NotoSansTibetan-Bold.ttf NotoSansTibetan-Regular.ttf NotoSansUI-Bold.ttf NotoSansUI-BoldItalic.ttf NotoSansUI-Italic.ttf NotoSansUI-Regular.ttf NotoSansCham-Bold.ttf NotoSansCham-Regular.ttf)

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${_pkgsa}"

  for fnt in "${_sans[@]}"; do
    install -m644 "$fnt" "${pkgdir}"/usr/share/fonts/"${_pkgsa}"
  done

  # Noto Serif
  _serif=(NotoSerif-Bold.ttf NotoSerif-BoldItalic.ttf NotoSerif-Italic.ttf NotoSerif-Regular.ttf NotoSerifArmenian-Bold.ttf NotoSerifArmenian-Regular.ttf NotoSerifGeorgian-Bold.ttf NotoSerifGeorgian-Regular.ttf NotoSerifKhmer-Bold.ttf NotoSerifKhmer-Regular.ttf NotoSerifLao-Bold.ttf NotoSerifLao-Regular.ttf NotoSerifThai-Bold.ttf NotoSerifThai-Regular.ttf NotoSerifBengali-Bold.ttf NotoSerifBengali-Regular.ttf NotoSerifDevanagari-Bold.ttf NotoSerifDevanagari-Regular.ttf NotoSerifGujarati-Bold.ttf NotoSerifGujarati-Regular.ttf NotoSerifKannada-Bold.ttf NotoSerifKannada-Regular.ttf NotoSerifMalayalam-Bold.ttf NotoSerifMalayalam-Regular.ttf NotoSerifTamil-Bold.ttf NotoSerifTamil-Regular.ttf NotoSerifTelugu-Bold.ttf NotoSerifTelugu-Regular.ttf)

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${_pkgse}"

  for fnt in "${_serif[@]}"; do
    install -m644 "$fnt" "${pkgdir}"/usr/share/fonts/"${_pkgse}"
  done

  # Noto Mono
  _mono=(NotoMono-Regular.ttf)

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${_pkgmo}"

  for fnt in "${_mono[@]}"; do
    install -m644 "$fnt" "${pkgdir}"/usr/share/fonts/"${_pkgmo}"
  done

  # License
  install -m755 -d "${pkgdir}/usr/share/licenses/$pkgname"
  install -m644 ../LICENSE \
    "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  cd "${srcdir}"

  # fontconfig templates
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m644 40-noto-arabic.conf \
    "${pkgdir}"/etc/fonts/conf.avail/40-noto-arabic.conf
  install -m644 45-noto-cros.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-noto-cros.conf
  install -m644 45-noto-sans.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-noto-sans.conf
  install -m644 45-noto-serif.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-noto-serif.conf
  install -m644 45-noto-mono.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-noto-mono.conf
  install -m644 90-tt-noto-cros.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-noto-cros.conf
  install -m644 90-tt-noto-sans.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-noto-sans.conf
  install -m644 90-tt-noto-serif.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-noto-serif.conf
  install -m644 90-tt-noto-mono.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-noto-mono.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/40-noto-arabic.conf .
  ln -s ../conf.avail/45-noto-cros.conf .
  ln -s ../conf.avail/45-noto-sans.conf .
  ln -s ../conf.avail/45-noto-serif.conf .
  ln -s ../conf.avail/45-noto-mono.conf .
  ln -s ../conf.avail/90-tt-noto-cros.conf .
  ln -s ../conf.avail/90-tt-noto-sans.conf .
  ln -s ../conf.avail/90-tt-noto-serif.conf .
  ln -s ../conf.avail/90-tt-noto-mono.conf .
}
