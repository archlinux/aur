# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
# Maintainer: Daniel Vogt <marioortizmanero@gmail.com>
pkgname=moodle-dl-git
_pkgname=Moodle-Downloader-2
pkgver=v2.2.1.4.r3.gd5e60fc
pkgrel=1
pkgdesc='Moodle downloader to download course content automatically'
arch=('any')
url='https://github.com/C0D3D3V/Moodle-Downloader-2'
license=('GPL3')
depends=('python' 'ffmpeg' 'python-sentry_sdk' 'python-colorama'
         'python-readchar' 'yt-dlp' 'python-certifi' 'python-html2text'
         'python-requests' 'python-aioxmpp')
makedepends=('git')
conflicts=('moodle-dl')
provides=('moodle-dl')
source=('git+https://github.com/C0D3D3V/Moodle-Downloader-2.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root=${pkgdir} --optimize=1
}
