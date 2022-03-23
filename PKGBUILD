
pkgname="python-ffmpeg-pip"
pkgver=0.2.0
pkgrel=1
pkgdesc='Python bindings for FFmpeg - with complex filtering support. Pip version since the main package (python-ffmpeg) refuses to build.'
arch=(any)
license=('Apache')
depends=(python ffmpeg)
makedepends=(python-pip)
provides=('python-ffmpeg')
conflicts=('python-ffmpeg')

pkgver() {
	pip3 show ffmpeg-python | grep 'Version:' | cut -d ' ' -f 2
}

package() {
	PIP_CONFIG_FILE=/dev/null pip3 install --isolated --root="$pkgdir" --ignore-installed --no-deps ffmpeg-python
}
