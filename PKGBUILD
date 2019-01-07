# Maintainer: teraflops < cprieto.ortiz@gmail.com >
# Packager: teraflops < cprieto.ortiz@gmail.com >

pkgname=google-music-manager-auth-git
_gitname=google-music-manager-auth
pkgver=r54.08a07b9
pkgrel=1
pkgdesc="Google Music Manager Auth Daemon"
arch=('any')
url="https://github.com/jaymoulin/google-music-manager-auth"
license=('MIT')
depends=('python-netifaces' 'python-watchdog' 'python-gmusicapi-git' 'python-beautifulsoup4' )
makedepends=('python-setuptools' 'git')
provides=('google-music-manager-auth')
conflicts=('google-music-manager-auth')
source=("google-music-manager-auth::git+https://github.com/jaymoulin/google-music-manager-auth.git")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_gitname}"
	    python setup.py install --root="$pkgdir" --optimize=1
}
