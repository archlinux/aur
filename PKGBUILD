# Maintainer: Juan Perez gatitofeliz at protonmail at com

# ALERT: These profiles are taken from github and couldn't work 
# ALERTA: Estos perfiles son inestbles y pueden fallar.

pkgname=firejail-extras
pkgver=0.9.42
pkgrel=8
pkgdesc="Extra profiles for firejail"
arch=('any')
url="https://aur.archlinux.org/packages/firejail-extras/"
license=('GPL2')
source=("git+https://github.com/chiraag-nataraj/firejail-profiles.git"
        "natron.profile" 
        )

sha256sums=( 'SKIP'
'5f15f2be830f6904ee488b11bedcfc4e79fbceba3772a71f5a3d88e095e0b545'
)

sha512sums=( 'SKIP'
'522ac9273dbac3fcab4dcd3ddbec61761650a8585e4af2cc8b064393002961a680c967abf6554cd7c5c0e3904eb055514cb32ab68e9889d12596ccc4bfb5a0ef'
)

sha224sums=( 'SKIP'
'1bf77c3b57b7c3d363a6de93a3edb0d6f573be33603f7469203246cd'
)

sha384sums=( 'SKIP'
'10279ccfa8e14048e8f1b3edd1184950764f2f2f04547855fde569fafb272641bb51466491bc333de5f3c17d39d6924e'
)








package() {
	cd "${srcdir}"

        rm   ${srcdir}/firejail-profiles/firefox.profile
        rm   ${srcdir}/firejail-profiles/google-chrome.profile
        rm   ${srcdir}/firejail-profiles/libreoffice.profile

	mkdir -p "${pkgdir}/etc/firejail"
        

	for file in ${srcdir}/*.profile
	do
		install -D -m644 "${file}" "${pkgdir}/etc/firejail/"
	done

	for file in ${srcdir}/firejail-profiles/*.profile
	do
		install -D -m644 "${file}" "${pkgdir}/etc/firejail/"
                sed -i 's/.kde/.kde4/g' *.profile
                sed -i 's/openshot/openshot-qt/g' *.profile
	done
}
