# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: mark.blakeney at bullet-systems dot net
# Contributor: Jameson Pugh <imntreal AT gmail DOT com>

pkgname='skype'
pkgdesc='P2P software for high-quality voice communication'
pkgver='8.18.0.6'
pkgrel=1
_pkgbranch='skypeforlinux'
arch=('x86_64')
url='http://www.skype.com'
license=('custom')
depends=('gtk2' 'libxss' 'gconf' 'alsa-lib' 'libxtst' 'libsecret' 'nss')
optdepends=('gnome-keyring: for credentials storage')
conflicts=('skypeforlinux' 'skypeforlinux-stable' 'skypeforlinux-preview' 'skypeforlinux-stable-bin' 'skypeforlinux-preview-bin')
source=("https://repo.skype.com/deb/pool/main/s/${_pkgbranch}/${_pkgbranch}_${pkgver}_amd64.deb")
sha256sums=('2fc2138c7c6118c3c70576ab593977905463202a7d97fa7111ada0a1c36771a4')

package() {

	tar -xJC "${pkgdir}" -f data.tar.xz
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	rm -rf "${pkgdir}/opt"
	mv "${pkgdir}/usr/share/${_pkgbranch}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/"

}
