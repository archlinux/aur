gitname=instant-music
pkgname=python-${gitname}-git
pkgver=151.bd2d28b
pkgrel=1
pkgdesc="Instantly download any song (git version)"
arch=('any')
url="https://github.com/yask123/Instant-Music-Downloader"
license=("unknown")
makedepends=('git' 'python-setuptools')
depends=('youtube-dl' 'python-beautifulsoup4')
provides=('python-instant-music')
conflicts=('python-instant-music')
source=("git+https://github.com/yask123/Instant-Music-Downloader.git")
sha256sums=('SKIP')

pkgver() {
	 cd "${srcdir}/Instant-Music-Downloader"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

package() {
	 cd "${srcdir}/Instant-Music-Downloader/instantmusic-0.1/"
	 python setup.py install --root="${pkgdir}" --optimize=1
}