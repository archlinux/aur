# Maintainer: Tom Wizetek <tom@wizetek.com>

pkgname=xhip
pkgver=8.0.alpha.r1100
pkgrel=1
pkgdesc="Free subtractive/hybrid synthesizer VST plug-in"
arch=('x86_64' 'i686')
url="http://xhip.net/synth/"
license=('custom')
groups=('vst-plugins')

source_i686=('http://xhip.net/synth/releases/xhip_8_linux_32bit_alpha_r1100.7z')
source_x86_64=('http://xhip.net/synth/releases/xhip_8_linux_64bit_alpha_r1100.7z'
		'http://xhip.net/synth/releases/xhip_8_linux_32bit_alpha_r1100.7z')
source=('http://xhip.net/synth/releases/xhip_factory_bank.xhipbank'
	'http://xhip.net/synth/releases/synth_drums_1e.xhipbank'
	'http://xhip.net/synth/releases/xhip_8_user_manual.pdf'
	'http://xhip.net/synth/releases/xhip_icon.7z')

md5sums=('21157e98cfb900d552e231c22de6bf1e'
         'b0ade51c3c3b2ee27477e0408d8b489c'
         'd7d5f87fde2de9ffedc8171e9b846f6a'
         '71b67e6859a32ee97c369b7167e672e7')
md5sums_x86_64=('01ea40a2219fe85ce8b7109e64862000'
                'ae332480b70c4d78c360f393cbf5c77d')
md5sums_i686=('ae332480b70c4d78c360f393cbf5c77d')

package() {
  for so_file in *.so; do
    install -Dm755 "${srcdir}/${so_file}" -t "${pkgdir}/usr/lib/vst"
  done

  for bank_file in *.xhipbank; do
    install -Dm644 "${srcdir}/${bank_file}" -t "${pkgdir}/usr/share/${pkgname}/banks"
  done

  install -Dm644 "${srcdir}/xhip_8_user_manual.pdf" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}/xhip.ico" -t "${pkgdir}/usr/share/${pkgname}/icons"
}
