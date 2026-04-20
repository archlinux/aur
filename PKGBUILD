# Original maintainer: Pieter Goetschalckx
# Maintainer: Guillaume BOEHM

pkgname=nordzy-cursors
pkgver=2.5.0
pkgrel=1
pkgdesc='Cursor theme using the Nord color palette and based on Vimix and cz-Viator'
arch=(any)
url='https://gitlab.com/gboehm/Nordzy-cursors'
license=('GPL3')
_giturl='https://gitlab.com/gboehm/Nordzy-cursors'
source=(
	"${_giturl}/-/releases/v${pkgver}/downloads/Nordzy-cursors.tar.gz"
	"${_giturl}/-/releases/v${pkgver}/downloads/Nordzy-cursors-lefthand.tar.gz"
	"${_giturl}/-/releases/v${pkgver}/downloads/Nordzy-cursors-white.tar.gz"
	"${_giturl}/-/releases/v${pkgver}/downloads/Nordzy-cursors-white-lefthand.tar.gz"
)
noextract=("${source[@]##*/}")
sha256sums=('88f2a1ed293d7b8145208d8e29537951a237e59acd756805964a8d7494df4900'
        'a6ec6a9cfc64a677b26fb07f87de3c3f463b08dab527ad94316fdbfa26d5a756'
        '4994146acdec59bbd2c296090e6b4bec29c11c17bc728a9eb535fc7d47d13173'
        '419a18811b137774783dec8de32c84589a39d4f1686a71904d353521a229e82d')

package() {
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-lefthand"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-white"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-white-lefthand"

	tar --no-same-owner -zxvf Nordzy-cursors.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-lefthand.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-white.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-white-lefthand.tar.gz -C "${pkgdir}/usr/share/icons/"
}
