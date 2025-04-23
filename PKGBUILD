# Contributor: Arnau Sanchez <tokland {at} gmail {dot} com>
# Maintainer: SanskritFritz (gmail)

pkgname=youtube-upload-git
_gitname=youtube-upload
pkgver=0.8.0.r199.g6a30b55
pkgrel=1
pkgdesc="Upload videos to Youtube from the command-line."
arch=("any")
url="https://github.com/tokland/youtube-upload/"
license=('GPL3')
depends=('python-google-api-python-client' 'python-progressbar' 'python-oauth2client')
provides=('youtube-upload')
conflicts=('youtube-upload')
makedepends=("git")
source=("git+https://github.com/tokland/youtube-upload.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
 
package() {
	cd "$_gitname"
	python setup.py install --root=$pkgdir/ --optimize=1
}

