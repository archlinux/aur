# Contributor: Arnau Sanchez <tokland {at} gmail {dot} com>
# Maintainer: SanskritFritz (gmail)

pkgname=youtube-upload-git
_gitname=youtube-upload
pkgver=0.8.0.r4.g072a7eb
pkgrel=2
pkgdesc="Upload videos to Youtube from the command-line."
arch=("any")
url="https://github.com/tokland/youtube-upload/"
license=('GPL3')
depends=('python2-google-api-python-client' 'python2-progressbar')
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
	python2 setup.py install --root=$pkgdir/ --optimize=1
}

