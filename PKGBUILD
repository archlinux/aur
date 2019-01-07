# Maintainer: teraflops < cprieto.ortiz@gmail.com >
# Packager: teraflops < cprieto.ortiz@gmail.com >

pkgname=google-music-manager-downloader-git
_gitname=google-music-manager-downloader
pkgver=r54.095e7d9
pkgrel=1
pkgdesc="Google Music Manager Downloader Daemon"
arch=('any')
url="https://github.com/jaymoulin/google-music-manager-downloader"
license=('MIT')
depends=('python-netifaces' 'python-watchdog' 'python-gmusicapi-git' 'python-beautifulsoup4' )
makedepends=('python-setuptools' 'git')
provides=('google-music-manager-downloader')
conflicts=('google-music-manager-downloader')
source=("google-music-manager-downloader::git+https://github.com/jaymoulin/google-music-manager-downloader.git")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_gitname}"
	    python setup.py install --root="$pkgdir" --optimize=1
}
