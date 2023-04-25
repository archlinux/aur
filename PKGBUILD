# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=decent-sampler-bin
pkgver=1.8.9
pkgrel=2
pkgdesc="a sampling plugin that allows you to play samples in the Decent Sampler format"
arch=(x86_64)
url="https://www.decentsamples.com/product/decent-sampler-plugin/"

# dropbox link:https://www.dropbox.com/sh/dwyry6xpy5uut07/AABBJ84bjTTSQWzXGG5TOQpfa\

license=('nonfree')
depends=('alsa-lib' 'freetype2')
provides=('decent-sampler')
source=("https://www.dropbox.com/sh/dwyry6xpy5uut07/AABF59kSghReGue2_KZlf8YFa/Decent_Sampler-1.8.9-Linux-Static-x86_64.tar.gz" "decent sampler.png" "decent sampler.desktop" "application-decent-sampler.xml")
sha256sums=('SKIP' 'f2eb1d90eb08cf725a139b2c05c48a3b40b245aa8c92aea34c5ec6f35630e31b' '23420f5a6839ce70c3f28fe8e3abd45b47b722be9805ebfbf5630bd4cda17ca1' 'f45eefe4e35d6973e55af2ff3a07d392273b2141dc8ff025c0f86597bbb90bb8')

package() {
	cd "Decent_Sampler-${pkgver}-Linux-Static-x86_64"
	install -Dm755 "DecentSampler" "${pkgdir}/usr/bin/DecentSampler"
	install -Dm755 "DecentSampler.so" "${pkgdir}/usr/lib/vst/DecentSampler.so"
	install -d "${pkgdir}/usr/lib/vst3"
	cp -r "DecentSampler.vst3" "${pkgdir}/usr/lib/vst3/"
	cd "${srcdir}"
	install -Dm755 "decent-sampler.desktop" "${pkgdir}/usr/share/applications/decent-sampler.desktop"
	install -Dm755 "decent-sampler.png" "${pkgdir}/usr/share/pixmaps/decent-sampler.png"
	install -Dm755 "application-decent-sampler.xml" "${pkgdir}/usr/share/mime/packages/application-decent-sampler.xml"
}
