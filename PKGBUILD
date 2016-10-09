# Maintainer: Juan Perez gatitofeliz at protonmail at com

# ALERT: These profiles are taken from github and couldn't work 
# ALERTA: Estos perfiles son inestbles y pueden fallar.

pkgname=firejail-extras
pkgver=0.9.42
pkgrel=10
pkgdesc="Extra profiles for firejail"
arch=('any')
url="https://github.com/chiraag-nataraj/firejail-profiles"
license=('GPL2')
source=("git+https://github.com/chiraag-nataraj/firejail-profiles.git"

        )

sha256sums=( 'SKIP'

)

sha512sums=( 'SKIP'

)

sha224sums=( 'SKIP'

)

sha384sums=( 'SKIP'

)








package() {
	cd "${srcdir}"

        rm   ${srcdir}/firejail-profiles/firefox.profile
        rm   ${srcdir}/firejail-profiles/google-chrome.profile
        rm   ${srcdir}/firejail-profiles/libreoffice.profile
        rm   ${srcdir}/firejail-profiles/skype.profile

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
