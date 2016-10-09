# Maintainer: Juan Perez gatitofeliz at protonmail at com

# ALERT: These profiles are taken from github and couldn't work 
# ALERTA: Estos perfiles son inestbles y pueden fallar.

pkgname=firejail-extras
pkgver=0.9.42
pkgrel=9
pkgdesc="Extra profiles for firejail"
arch=('any')
url="https://github.com/chiraag-nataraj/firejail-profiles"
license=('GPL2')
source=("git+https://github.com/chiraag-nataraj/firejail-profiles.git"
        "darktable.profile" 
        "shotcut.profile"
        "zart.profile"
        )

sha256sums=( 'SKIP'
'65feb10ed75cd9412b9edfa7f947d1bec32d4893529b1c35f0d534ed804382e2'
'b34e36707274cc2609c23514f62871e2a253bf6c81bdd37f62f072f3d1cccec9'
'135cb04b919fe6746e215c3f014798631be68b64d46ceacd23d1fb6a71d73d24'
)

sha512sums=( 'SKIP'
'15c3eab2b0c91285c7756aa55dbbd5435fcdcec3bbe1d9bd1192e052791279c085c0e96703f876dc5b7aabd8ab131be8ccd4300494167e6e085574cf8af4887e'
'97bf143d67767c13e2efafd3e8b51c01f81da7b8ca3632b95ba6dd0d58d23c0b8917b0ae2dd111b1ea3f1b21cc65dd3d5ec8f0b05fe66d6d268e397cff3d42c5'
'0e9b83366ede6c07ac496de7ccdb034c275d110d14e4612a7ca287fc2dba3ac226dab09aa696f1e6a28b2a4321bd7418ab81ea5f81f3fe32881c343aadf6bb6e'
)

sha224sums=( 'SKIP'
'e8e9cafe50dac40232d6ceb65f0a9715d0ebe9c25f22dee70765b10e'
'fff554b1f47a3fa96ca5d006e166c2efa9668a4deb0beec801c6f73e'
'b619665688dc261ca1be3cd4fb37fbb0fdc333e65f96f1301e84bfb7'
)

sha384sums=( 'SKIP'
'ae88ffcd3737f172e956d779d7140e745a3552086d3c3531597d8d5ec60c7e8b1736beb4e1c0170bc1958a91f782cbf6'
'4772a7064b3a33f55fd2954fc0dfba4d5d915643e02fc6313cc578b479219f4e01f4667afddb817900c037e3eb7425ba'
'4d8a3e7299c62308135b5dac0b18218eab017f6e29c95fe436503af17aa7496b3a83bdb71c4f2b3eddfb7469830950be'
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
