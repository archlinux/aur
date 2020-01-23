# Maintainer: robertfoster
pkgname=google-music-manager-auth
pkgver=1.3.0
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

sha256sums=('cced52b6b3c927daf94ed97ddecab29ad252e9fac3edb4d2400a4e979cda207e')
