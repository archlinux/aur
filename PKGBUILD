# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: mark.blakeney at bullet-systems dot net
# Contributor: Jameson Pugh <imntreal AT gmail DOT com>

pkgname='skype'
pkgdesc='P2P software for high-quality voice communication'
pkgver='8.17.76.1'
pkgrel=1
_pkgbranch='skypeforlinux'
arch=('x86_64')
url='http://www.skype.com'
license=('custom')
depends=('gtk2' 'libxss' 'gconf' 'alsa-lib' 'libxtst' 'libsecret' 'nss')
optdepends=('gnome-keyring: for credentials storage')
conflicts=('skypeforlinux' 'skypeforlinux-preview' 'skypeforlinux-preview-bin')
source=("https://repo.skype.com/deb/pool/main/s/${_pkgbranch}/${_pkgbranch}_${pkgver}_amd64.deb")
sha256sums=('393f5156b914c9f8e7f1b1f38d8de5bf7c7f93cb1b22fc1fe8bdc49282eee696')

package() {

	tar -xJC "${pkgdir}" -f data.tar.xz
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	mv "${pkgdir}/usr/share/${_pkgbranch}/LICENSES.chromium.html"	"${pkgdir}/usr/share/licenses/${pkgname}/"
	rm -rf "${pkgdir}/opt"

}
