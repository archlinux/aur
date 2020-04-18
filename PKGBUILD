# Maintainer: robertfoster
pkgname=google-music-manager-auth
pkgver=1.3.1
pkgrel=1
pkgdesc="Google Music Manager Auth Daemon"
arch=('any')
url="https://github.com/jaymoulin/google-music-manager-auth"
license=('MIT')
depends=('python-beautifulsoup4' 'python-gmusicapi' 'python-netifaces' 'python-watchdog' )
makedepends=('python-setuptools')
source=("https://github.com/jaymoulin/google-music-manager-auth/archive/$pkgver.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's/bs4/beautifulsoup4/g' setup.cfg
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('d20453d18dbef8996e9b3e4ed463bd7b3f7921395ae6dc29a16d506972c64e43')
