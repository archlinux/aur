# Maintainer: teraflops < cprieto.ortiz@gmail.com >
# Packager: teraflops < cprieto.ortiz@gmail.com >

pkgname=google-music-manager-uploader-git
_gitname=google-music-manager-uploader
pkgver=r54.08a07b9
pkgrel=1
pkgdesc="Google Music Manager Uploader Daemon"
arch=('any')
url="https://github.com/jaymoulin/google-music-manager-uploader"
license=('MIT')
depends=('python-netifaces' 'python-watchdog' 'python-gmusicapi-git' 'python-beautifulsoup4' )
makedepends=('python-setuptools' 'git')
provides=('google-music-manager-uploader')
conflicts=('google-music-manager-uploader')
source=("google-music-manager-uploader::git+https://github.com/jaymoulin/google-music-manager-uploader.git")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_gitname}"
	    python setup.py install --root="$pkgdir" --optimize=1
}
