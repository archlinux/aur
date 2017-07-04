# Maintainer: Hannes Eichblatt aur at hanneseichblatt.de
# Contributor: Juan Perez gatitofeliz at protonmail at com

# ALERT: These profiles are taken from github and couldn't work 
# ALERTA: Estos perfiles son inestbles y pueden fallar.

pkgname=firejail-extras
pkgver=0.9.445
pkgrel=5
pkgdesc="Extra profiles for firejail"
arch=('any')
url="https://github.com/triceratops1/fe"
license=('GPL2')
source=("git+https://github.com/chiraag-nataraj/firejail-profiles.git"
        "git+https://github.com/triceratops1/fe.git"
        )

sha256sums=( 'SKIP'
             'SKIP'
)

sha512sums=( 'SKIP'
             'SKIP'
)

sha224sums=( 'SKIP'
             'SKIP'
)

sha384sums=( 'SKIP'
             'SKIP'
)








package() {

	cd "${srcdir}"
        msg2 remove profiles added to upstream
        rm   ${srcdir}/firejail-profiles/firefox.profile
        rm   ${srcdir}/firejail-profiles/google-chrome.profile
        rm   ${srcdir}/firejail-profiles/libreoffice.profile
        rm   ${srcdir}/firejail-profiles/skype.profile
        rm   ${srcdir}/firejail-profiles/flowblade.profile
        rm   ${srcdir}/firejail-profiles/gimp.profile
        rm   ${srcdir}/firejail-profiles/inkscape.profile
        rm   ${srcdir}/firejail-profiles/mutt.profile
        rm   ${srcdir}/firejail-profiles/openshot.profile
        rm   ${srcdir}/firejail-profiles/qpdfview.profile
        rm   ${srcdir}/firejail-profiles/synfigstudio.profile 
        rm   ${srcdir}/firejail-profiles/virtualbox.profile  
        rm   ${srcdir}/firejail-profiles/luminance-hdr.profile
        rm   ${srcdir}/firejail-profiles/mupdf.profile
        rm   ${srcdir}/firejail-profiles/pidgin.profile
        rm   ${srcdir}/firejail-profiles/akregator.profile
        rm   ${srcdir}/firejail-profiles/blender.profile
        rm   ${srcdir}/firejail-profiles/hugin.profile
        rm   ${srcdir}/firejail-profiles/scribus.profile
        rm   ${srcdir}/firejail-profiles/viewnior.profile
        rm   ${srcdir}/firejail-profiles/dia.profile
        rm   ${srcdir}/firejail-profiles/youtube-dl.profile
        rm   ${srcdir}/firejail-profiles/darktable.profile

        rm   ${srcdir}/fe/7z.profile
        rm   ${srcdir}/fe/feh.profile
        rm   ${srcdir}/fe/keepass.profile
        rm   ${srcdir}/fe/keepassx.profile
        rm   ${srcdir}/fe/zathura.profile
        rm   ${srcdir}/fe/cvlc.profile
        rm   ${srcdir}/fe/fossamail.profile
        rm   ${srcdir}/fe/gjs.profile
        rm   ${srcdir}/fe/gpa.profile
        rm   ${srcdir}/fe/kino.profile
        rm   ${srcdir}/fe/lynx.profile
        rm   ${srcdir}/fe/pluma.profile
        rm   ${srcdir}/fe/qupzilla.profile
        rm   ${srcdir}/fe/uzbl-browser.profile

        msg2 create package
       
	mkdir -p "${pkgdir}/etc/firejail"


	for file in ${srcdir}/fe/*.profile
	do
		install -D -m644 "${file}" "${pkgdir}/etc/firejail/"
	done
                sed -i 's/.kde/.kde4/g'  ${srcdir}/firejail-profiles/*.profile
                sed -i 's/openshot/openshot-qt/g'  ${srcdir}/firejail-profiles/*.profile
                sed -i 's/.kde4/kde/g'  ${srcdir}/firejail-profiles/kdenlive.profile
                sed -i 's/.kde4/kde/g'  ${srcdir}/firejail-profiles/kdenlive.profile
                sed -i 's/private-binkdenlivekdenlive_render,/private-bin kdenlive,kdenlive_render,/g'  ${srcdir}/firejail-profiles/kdenlive.profile



	for file in ${srcdir}/firejail-profiles/*.profile
	do
	
install -D -m644 "${file}" "${pkgdir}/etc/firejail/"


	done
}
