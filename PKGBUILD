# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: mark.blakeney at bullet-systems dot net
# Contributor: Jameson Pugh <imntreal AT gmail DOT com>

pkgname='skype'
pkgdesc='P2P software for high-quality voice communication'
pkgver='8.18.76.1'
pkgrel=1
_pkgbranch='skypeforlinux'
arch=('x86_64')
url='http://www.skype.com'
license=('custom')
depends=('gtk2' 'libxss' 'gconf' 'alsa-lib' 'libxtst' 'libsecret' 'nss')
optdepends=('gnome-keyring: for credentials storage')
conflicts=('skypeforlinux' 'skypeforlinux-preview' 'skypeforlinux-preview-bin')
source=("https://repo.skype.com/deb/pool/main/s/${_pkgbranch}/${_pkgbranch}_${pkgver}_amd64.deb")
sha256sums=('ac25cccb44e3872b0d8ba41cf0d49a69403d6d82a920705ba57ea191179cc926')

package() {

	tar -xJC "${pkgdir}" -f data.tar.xz
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	mv "${pkgdir}/usr/share/${_pkgbranch}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/"
	rm -rf "${pkgdir}/opt"

}
