# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=autosuspend
pkgver=0.3
pkgrel=1
pkgdesc="A daemon to suspend your server in case of inactivity"
arch=(any)
url="https://github.com/languitar/autosuspend"
license=('GPL2')
depends=('python' 'python-psutil')
optdepends=('python-mpd2: MPD playing status checks')
makedepends=('python-setuptools')
source=("https://github.com/languitar/autosuspend/archive/release-${pkgver}.tar.gz")
md5sums=('aa423709213959201605d394a97f270f')

package() {
    cd "$pkgname-release-${pkgver}"
    python3 setup.py install --root="$pkgdir/" --install-data=/usr
    # setuptools install_data is a nightmare, and cannot be made to respect the
    # filesystem hierarchy. Do things manually instead.
    mv "$pkgdir/usr/etc" "$pkgdir"
}
