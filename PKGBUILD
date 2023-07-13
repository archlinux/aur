# Maintainer: codeberge <concur_panama530 at slmail dot me>
pkgname=dl-stream-git
_pkgname=dl-stream
pkgver=44.48be3d6
pkgrel=1
pkgdesc="Ad-free Twitch streams and videos via streamlink and ttvlol plugin"
arch=('any')
url="https://codeberg.org/codeberge/${_pkgname}"
license=('GPL3')
depends=('streamlink' 'curl')
makedepends=('git')
optdepends=('mpv: For watching content' 
            'chatterino: For opening chat' 
	    'ffmpeg: For conversion after download')
source=("git+https://codeberg.org/codeberge/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}"
    install -D -m755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
