# Maintainer: Justin Dray <justin@dray.be>

pkgname='leapcast'
pkgver=0.9
pkgrel=1
pkgdesc='Enables streaming via chromecast protocol'
url='https://github.com/dz0ny/leapcast'
license=('MIT')
arch=('any')
makedepends=('git' 'python-distribute')
depends=('python2-tornado' 'python2-requests' 'python2-setuptools' 'twisted')
conflicts=('leapcast-git')
source=("git://github.com/dz0ny/leapcast"
        "leapcast.service")
sha256sums=('SKIP'
            '1a288790ff86ce590733aaa399e73576981ef5b5bb0a046a3af3d939af57acd6')

package() {
	cd "${srcdir}/leapcast"
	python2 setup.py install --root="${pkgdir}" --optimize=1
	install -Dm0644 "$srcdir/leapcast.service" "$pkgdir/usr/lib/systemd/user/leapcast.service"
}
