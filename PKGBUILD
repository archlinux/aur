# Maintainer: altaway <email@altaway.uk> 
pkgname=vital-synth
pkgver=1.0.3
pkgrel=5
pkgdesc="Powerful wavetable synthesizer with realtime modulation feedback. Vital is a MIDI enabled polyphonic music synthesizer with an easy to use parameter modulation system with real-time graphical feedback."
# arch=('x86_64' 'i686')
arch=('x86_64')
url="https://vital.audio"
license=('custom')
# groups=('pro-audio' 'lv2-plugins' 'vst-plugins' 'vst3-plugins')
depends=('alsa-lib>=1.0.16' 'freetype2>=2.2.1' 'gcc-libs' 'gcc>=3.3.1' 'glib2>=2.12.0' 'glibc>=2.17' 'libcurl-gnutls>=7.16.2' 'libgl' 'libglvnd' 'libsecret>=0.7')
# optdepends=('aarch64-linux-gnu-gcc>=5: support for aarch64')
# options=('!strip' '!emptydirs')
install=${pkgname}.install
pkgname_deb="VitalInstaller"
source_x86_64=("${pkgname_deb}-${pkgver}-${pkgrel}.deb::https://github.com/altaway/VitalInstaller/releases/download/v${pkgver}-${pkgrel}/${pkgname_deb}.deb")
sha512sums_x86_64=('5d58a1872a2e3999f2fa40f2566496d884b5dd6bdae1e8ca183b0325b42b2980925b1080884b5cd5ee3eb6852c65bf4caf3f8d111a08b00db321012d77a238cf')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/vital/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
