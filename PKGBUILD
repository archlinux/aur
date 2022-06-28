# Maintainer: TwoLeaves < ohneherren at gmail dot com >

pkgname=nzbget-ppscript-nzbtomedia-git
pkgver=2637.d956cd2b
_gitname=nzbToMedia
pkgrel=1
arch=(any)
pkgdesc="Post-processing scripts to communicate with media managers."
url="https://github.com/clinton-hall/nzbToMedia"
license=('GPL3')
depends=('nzbget' 'python')
makedepends=('git')
optdepends=('couchpotato' 'headphones' 'mylar-git' 'sonarr'
	    'ffmpeg: to use the transcoding option')
install=install
source=("git+https://github.com/clinton-hall/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  install -Dm644 "${_gitname}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -dm755 ${pkgdir}/usr/share/nzbget/ppscripts
  cp -a ${_gitname}/* ${pkgdir}/usr/share/nzbget/ppscripts
}
