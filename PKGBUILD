# Maintainer: yubimusubi
# Original Maintainer: Justin Dray <justin@dray.be>

pkgname='leapcast'
epoch=1 # Needed because of version change from 0.9 -> 0.1.x
pkgver=0.1.3
pkgrel=1
pkgdesc='Enables streaming via chromecast protocol'
url='https://github.com/dz0ny/leapcast'
license=('MIT')
arch=('any')
makedepends=('git' 'python-distribute')
depends=('python2-tornado' 'python2-requests' 'python2-setuptools' 'twisted')
conflicts=('leapcast-git')
source=("https://github.com/dz0ny/leapcast/archive/${pkgver}.tar.gz"
        "leapcast.service")
sha256sums=('0ef6535a18e43b61daae8ee9f9fa05f055f2777254491d7834e86c34a9482264'
            '1a288790ff86ce590733aaa399e73576981ef5b5bb0a046a3af3d939af57acd6')

package() {
	cd "${srcdir}/leapcast-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
	install -Dm0644 "$srcdir/leapcast.service" "$pkgdir/usr/lib/systemd/user/leapcast.service"
}
